//
//  UserDefaultsConvertible.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public protocol UserDefaultsConvertible {
    associatedtype UserDefaultsType: UserDefaultsSupportedType

    static func decode(userDefaultsValue value: UserDefaultsType) -> Self?
    var encodeForUserDefaults: UserDefaultsType? { get }
}

extension Optional: UserDefaultsConvertible where Wrapped: UserDefaultsConvertible {

    public typealias UserDefaultsValueType = Wrapped
    public typealias UserDefaultsType = Wrapped.UserDefaultsType

    public static func decode(userDefaultsValue value: Wrapped.UserDefaultsType) -> Optional<Wrapped>? {
        return Wrapped.decode(userDefaultsValue: value)
    }

    public var encodeForUserDefaults: Wrapped.UserDefaultsType? {
        return wrappedValue?.encodeForUserDefaults
    }
}

struct UserDefaultsConvertibleBox<T: UserDefaultsConvertible>: UserDefaultsTransaction {

    let value: T

    var supportedType: Data? {
        return value.encodeForUserDefaults?.encode as Data?
    }

    init?(storedValue: Data?) {
        guard let storedValue: T.UserDefaultsType = storedValue?.decode(),
            let value = T.decode(userDefaultsValue: storedValue)
            else
        {
            return nil
        }

        self.value = value
    }

    init(_ value: T) {
        self.value = value
    }
}

struct UserDefaultsCodableBox<T: Codable>: UserDefaultsTransaction {

    let value: T

    var supportedType: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode([value])
    }

    init?(storedValue: Data?) {
        guard let storedValue = storedValue else {
            return nil
        }

        let processedData = _decodeLegacyType(T.self, data: storedValue)
            ?? storedValue

        let decoder = JSONDecoder()
        if let box = try? decoder.decode([T].self, from: processedData),
            let value = box.first {
            self.value = value
        } else {
            return nil
        }
    }

    init(_ value: T) {
        self.value = value
    }
}

private func _decodeLegacyType<T>(_ type: T.Type, data: Data) -> Data? {

    func wrap<C: Codable>(_ value: C) -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode([value])
    }

    switch type {
    case is Int.Type, is Int?.Type:
        return (data.decode() as NSNumber?).flatMap { wrap($0.intValue) }
    case is Double.Type, is Double?.Type:
        return (data.decode() as NSNumber?).flatMap { wrap($0.doubleValue) }
    case is Float.Type, is Float?.Type:
        return (data.decode() as NSNumber?).flatMap { wrap($0.floatValue) }
    case is Bool.Type, is Bool?.Type:
        return (data.decode() as NSNumber?).flatMap { wrap($0.boolValue) }
    case is String.Type, is String?.Type:
        return (data.decode() as NSString?).flatMap { wrap($0 as String) }
    case is Date.Type, is Date?.Type:
        return (data.decode() as NSDate?).flatMap { wrap($0 as Date) }
    default:
        return nil
    }
}

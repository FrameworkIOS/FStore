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
    var encodedForUserDefaults: UserDefaultsType? { get }
}


extension Optional: UserDefaultsConvertible where Wrapped: UserDefaultsConvertible {
    public typealias UserDefaultsValueType = Wrapped
    public typealias UserDefaultsType = Wrapped.UserDefaultsType
            
    public static func decode(userDefaultsValue value: Wrapped.UserDefaultsType) -> Optional<Wrapped>? {
        return Wrapped.decode(userDefaultsValue: value)
    }
    
    public var encodedForUserDefaults: Wrapped.UserDefaultsType? {
        return wrappedValue?.encodedForUserDefaults
    }
}


struct UserDefaultsConvertible<T: UserDefaultsConvertible>: UserDefaultsTransaction {
    let value: T
    
    var supportedType: Data? {
        return value.encodedForUserDefaults?.encode as Data?
    }
    
    init(storedValue: Data?) {
        guard let storedValue: T.UserDefaultsType = storedValue?.decode()
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

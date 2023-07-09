//
//  CacheConvertible.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public protocol CacheConvertible {
    associatedtype CacheType: CacheSupportedType
    static func decode(cacheValue value: CacheType) -> Self?
    var encodedForCache: CacheType? { get }
}

struct CacheConvertibleBox<T: CacheConvertible>: CacheTransaction {
    let value: T
    
    var supportedType: AnyObject? {
        let anyObject: AnyObject? = value.encodedForCache
        return anyObject
    }
    
    init?(storedValue: AnyObject?) {
        guard let cacheValue = storedValue as? T.CacheType,
              let value = T.decode(cacheValue: cacheValue)
        else {
            return nil
        }
        
        self.value = value
    }
    
    init(_ value: T) {
        self.value = value
    }
}


struct CacheNullableConvertibleBox<T: Nullable>: CacheTransaction where T.UnderlyingType: CacheConvertible {
    let value: T
    
    var supportedType: AnyObject? {
        return value.wrappedValue?.encodedForCache
    }
    
    init?(storedValue: AnyObject?) {
        guard let cacheValue = storedValue as T.UnderlyingType.CacheType,
              let value = T.UnderlyingType.decode()
        else {
            return nil
        }
    }
}

//
//  CacheSupportedType.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public typealias CacheSupportedType = AnyObject


struct CacheSupportedBox <T: CacheSupportedType>: CacheTransaction {
    let value: T
    
    var supportedType: AnyObject? {
        let anyObject: AnyObject? = value
        return anyObject
    }
    
    init?(storedValue: AnyObject?) {
        guard let value = storedValue as? T else {
            return nil
        }
        self.value = value
    }
    
    init(_ value: T) {
        self.value = value
    }
}


struct CacheNullableSupportedBox<T: Nullable>: CacheTransaction where T.UnderlyingType: CacheSupportedType {
    let value: T
    
    var supportedType: AnyObject? {
        return value.wrappedValue
    }
    
    init?(storedValue: AnyObject?) {
        guard let value = storedValue as? T.UnderlyingType else {
                return nil
        }
        self.value = T(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}

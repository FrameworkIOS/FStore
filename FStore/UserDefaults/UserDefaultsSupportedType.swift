//
//  UserDefaultsSupportedType.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation


public typealias UserDefaultsSupportedType = NSCoding


struct UserDefaultsSupportedTypeBox<T: UserDefaultsSupportedType>: UserDefaultsTransaction {
    
    let value: T
    
    var supportedType: Data? {
        return value.encode as Data
    }
    
    init?(storedValue: Data?) {
        
        guard let value: T = storedValue?.decode() else {
            return nil
        }
        
        self.value = value
    }
    
    init(_ value: T) {
        self.value = value
    }
}

struct UserDefaultsNullableSupportedTypeBox<T: Nullable>: UserDefaultsTransaction where T.UnderlyingType: UserDefaultsSupportedType {
    let value: T
    
    var supportedType: Data? {
        return value.wrappedValue?.encode as Data?
    }
    
    init?(storedValue: Data?) {
        
        guard let data = storedValue, let value: T.UnderlyingType = data.decode() else {
            return nil
        }
        
        self.value = T(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}

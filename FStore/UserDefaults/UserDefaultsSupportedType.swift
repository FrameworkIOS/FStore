//
//  UserDefaultsSupportedType.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public typealias UserDefaultSupportedType = NSCoding

struct UserDefaultsSupportedTypeBox<T: UserDefaultSupportedType>: UserDefaultsTransaction {
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


struct UserDefaultsNullableSupportedTypeBox<T: Nullable> {
    let value: T
    
}

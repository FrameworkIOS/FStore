//
//  UserDefaultsConvertible+Foundation.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation


extension NSCoding {
    
    var encode: Data {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }
}

extension Data {
    
    func decode<T>() -> T? {
        return NSKeyedUnarchiver.unarchiveObject(with: self) as? T
    }
}

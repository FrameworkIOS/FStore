//
//  UserDefaultTransaction.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

protocol UserDefaultsTransaction {
    
    associatedtype ValueType
    
    var supportedType: Data? { get }
    var value: ValueType { get }
    
    init?(storedValue: Data?)
    init(_ value: ValueType)
}

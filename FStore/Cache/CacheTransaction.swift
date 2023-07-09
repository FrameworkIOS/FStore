//
//  CacheTransaction.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

protocol CacheTransaction {
    
    associatedtype ValueType
    
    var supportedType: AnyObject? { get }
    var value: ValueType { get }
    
    init?(storedValue: AnyObject?)
    init(_ value: ValueType)
}

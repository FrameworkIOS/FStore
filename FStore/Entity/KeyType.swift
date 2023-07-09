//
//  KeyType.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public protocol KeyType {
    associatedtype NamespaceType: Namespace
    associatedtype ValueType
    
    var stringValue: String { get }
    var defaultValue: ValueType { get }
    
    func willChange(_ oldValue: ValueType, newValue: ValueType)
    
    func processChange(_ oldValue: ValueType, newValue: ValueType) -> ValueType {
        return newValue
    }
    
    func didChange(_ oldValue: ValueType, newValue: ValueType)
}

public extension KeyType {
    func willChange(_ oldValue: ValueType, newValue: ValueType) {}
    func processChange(_ oldValue: ValueType, newValue: ValueType) -> ValueType {
        return newValue
    }
    
    func didChange(_ oldValue: ValueType, newValue: ValueType) {}
}

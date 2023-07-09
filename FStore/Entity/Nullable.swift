//
//  Nullable.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public protocol Nullable {
    associatedtype UnderlyingType
    
    var wrappedValue: UnderlyingType? { get }
    
    init(_ some: UnderlyingType)
}

extension Optional: Nullable {
    public typealias UnderlyingType = Wrapped
    
    public var wrappedValue: UnderlyingType? {
        return map { $0 }
    }
}

//
//  CacheConvertible+Swift.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

// INT
extension Int: CacheConvertible {
    
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: CacheType) -> Int? {
        return value as? Int
    }
    
    public var encodeForCache: CacheType? {
        return self as AnyObject
    }
}

// DOUBLE
extension Double: CacheConvertible {
    
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: CacheType) -> Double? {
        return value as? Double
    }
    
    public var encodeForCache: CacheType? {
        return self as AnyObject
    }
}

// BOOl
extension Bool: CacheConvertible {
    
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: CacheType) -> Bool? {
        return value as? Bool
    }
    
    public var encodeForCache: CacheType? {
        return self as AnyObject
    }
}

// FLOAt
extension Float: CacheConvertible {
    
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: CacheType) -> Float? {
        return value as? Float
    }
    
    public var encodeForCache: CacheType? {
        return self as AnyObject
    }
}

// STRING
extension String: CacheConvertible {
    
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: CacheType) -> String? {
        return value as? String
    }
    
    public var encodeForCache: CacheType? {
        return self as AnyObject
    }
}

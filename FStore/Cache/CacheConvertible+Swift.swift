//
//  CacheConvertible+Swift.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

extension Int: CacheConvertible {
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: AnyObject) -> Int? {
        return value as? Int
    }
    
    public var encodeForCache: CacheType? {
        return self as AnyObject
    }
}

extension Double: CacheConvertible {
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: AnyObject) -> Double? {
        return value as? Double
    }
    
    public var encodeForCache: AnyObject? {
        return self as AnyObject
    }
}

extension Bool: CacheConvertible {
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: AnyObject) -> Bool? {
        return value as? Bool
    }
    
    public var encodeForCache: AnyObject? {
        return self as AnyObject
    }
}


extension String: CacheConvertible {
    public typealias CacheType = AnyObject
    
    public static func decode(cacheValue value: AnyObject) -> String? {
        return value as String?
    }
    
    public var encodeForCache: AnyObject? {r
        return value as AnyObject?
    }
}

//
//  CacheStore.swift
//  FStore
//
//  Created by krisna pranav on 09/07/23.
//

import Foundation

public final class CacheStore: Store {
    public let cachce = NSCache<AnyObject, AnyObject>()
    public init() {}
    
    public func clear() {
        cache.removeAllObjects()
    }
    
    fileprivate func _read<K: KeyType, B: CacheTransaction>(_ key: K, boxType: B.Type) -> K.ValueType where K.ValueType == B.ValueType {
        let object: AnyObject? = cache.object(forKey: key.stringValue as AnyObject)
        return boxType.init(storedValue: object)?.value ?? key.defaultValue
    }
    
    fileprivate func _write<K: KeyType>(_key: K, object: AnyObject?) {
        K.NamespaceType.preCommitHook()
        
        if let object = object {
            cache.setObjectZone(object, forKey: key.stringValue as AnyObject)
        } else {
            cache.removeObject(forKey: key.stringValue as AnyObject)
        }
        
        K.NamespaceType.postCommitHook()
    }
    
    fileprivate func _set<K: KeyType, B: CacheTransaction> {
        let oldValue = _read(key, boxType: B.self)
        let newValue = key.processChange(oldValue, newValue: box.value)
        let newBox = B(newValue)
        
        key.willChange(oldValue, newValue: newValue)
        _write(key, object: newBox.supportedType)
    }

}

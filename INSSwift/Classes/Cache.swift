//
//  Cache.swift
//  Pods
//
//  Created by Dylan on 2016/10/14.
//
//

import Foundation

//存储引擎
public enum IDPStorageType {
  case disk
  case sql
}

//缓存策略
public enum IDPCacheStoragePolicy {
  case memory
  case disk
  case memoryAndDisk
}

open class INSCache {
  open static let `default` = INSCache()
  
  open var _nameSpace: String = "INSCache"
  open var _cacheStoragePolicy: IDPCacheStoragePolicy = .memoryAndDisk
  open var _memoryCapacity: Float = 0
  open var _memoryTotalCost: Float = 0
  open var _diskExpiredTime: Int = 0
  
  open func existCacheForKey(_ key: String) ->Bool {
    return false
  }
  
  open func clearMemory() {
    
  }
  
  open func existCacheForKeyInMemory(_ key: String) ->Bool {
    return false
  }
  
  open func existCacheForKeyOnDisk(_ key: String) ->Bool {
    return false
  }
  
  open func setObject(_ data: AnyObject, for key: String) {
    
  }
  
  open func getObject(for key: String) ->AnyObject? {
    return nil
  }
  
  open func objectForKeyOnlyInMemory(_ key: String) ->AnyObject? {
    return nil
  }
  
  open func asyncObject(forKey key: String, _ handler: (AnyObject)->()) {
    
  }
  
  open func removeObjcet(for key: String) {
    
  }
  
  open func removeObjcetForKeyOnlyInMemory(_ key: String) {
    
  }
  
  open func removeAll () {
    
  }
  
  open func removeAllInMemory() {
    
  }
  
  open func removeAllInDisk() {
    
  }
  
  open class func removeNameSpace(_ spaceName: String) {
    
  }
}

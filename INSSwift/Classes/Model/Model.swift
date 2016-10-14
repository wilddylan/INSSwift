//
//  Model.swift
//  Pods
//
//  Created by Dylan on 2016/10/11.
//
//

import Foundation
import YYModel

open class Model: NSObject {
  open var _ModelIdentifier: String?
  
  open var _ModelUpdatedAt: Date?
  open var _ModelCreatedAt: Date?
  open var _ModelExpiredAt: Date?
  open var _ModelNeedsCache: Bool?
  
  open var _CurrentPage: Int = 0
  open var _PageSize: Int = 10
  open var _TotalCount: Int = 0
  open var _StartAt: Int = 0
  
  open func load() { }
  open func refresh() { }
  open func cancel() { }
  
  open func goNextPage() { }
  open func goPrevPage() { }
  
  open func hasPrev() ->Bool{ return false }
  open func hasNext() ->Bool{ return false }
  
  public override init() {
    
  }
}

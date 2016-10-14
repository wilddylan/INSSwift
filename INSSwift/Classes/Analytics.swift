//
//  Analytics.swift
//  Pods
//
//  Created by Dylan on 2016/10/13.
//
//

import Foundation
import LKDBHelper

let AnalyticsManagerFlushedFlagKey = "AnalyticsManagerFlushedFlagKey"

open class AnalyticsItem: NSObject {
  /// 事件名称
  open var eventName: String
  /// 事件数据
  open var parameters: [String: Any]?
  
  open func toAnalytice() ->[String: String] {
    return [eventName ?? "": "\(parameters ?? ["": ""])"]
  }
  
  public init(_ eventName: String, _ parameters: [String: Any]? = nil) {
    self.eventName = eventName
    self.parameters = parameters
  }
  
  override open static func getTableName() -> String {
    return "AnalyticsItem"
  }
}

open class Analytics {
  open static let `default` = Analytics()
  
  /// 追踪事件
  open func track(_ eventName: String, _ parameters: [String: Any]? = nil) {
    
  }
  
  /// 主动上报到服务器
  open func flush() {
    
  }
  
  /// 设置标记
  open func setNeedsRestoreItems() {
    
  }
  
  private init() {
    
  }
  
  deinit {
    
  }
}

public let AnalyticsManager = Analytics.default

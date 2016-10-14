//
//  Push.swift
//  Pods
//
//  Created by Dylan on 2016/10/13.
//
//

import Foundation

open class Push {
  open static let `default` = Push()
  
  open func DeviceToken(_ deviceToken: Data) {
    AnalyticsManager.track("DeviceToken", ["token": deviceToken])
  }
  
  open func ReceivedPushMessage (_ userInfo: [AnyHashable : Any]) {
    AnalyticsManager.track("PushInfo", ["info": userInfo])
  }
  
  public init() {
    
  }
}

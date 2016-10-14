//
//  NetworkPlugin.swift
//  INSSwift
//
//  Created by Dylan on 2016/10/10.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import INSSwift

class NetworkPlugin: Plugin {
  override func serviceStarted() {
    ILog(.debug, "Network service started")
  }
  
  override func serviceStopped() {
    ILog(.debug, "Network service stopped")
  }
  
  override func pluginScheme() -> String! {
    return "Network"
  }
  
  override func dataflowMapping() ->Dictionary<String, INSDataFlowHandler>? {
    let mapping: [String: INSDataFlowHandler] = [
      "getData": {
        ILog(.warning, "receive call \($0)")
        return "Custom data"
      },
      "supportMethod": {
        ILog(.warning, "receive call \($0)")
        return [
          "GET",
          "POST",
          "PUT",
          "DELETE"
          ]
      }
    ]
    return mapping
  }
  
  override func classMapping() -> Dictionary<String, AnyClass>? {
    let mapping: [String: AnyClass] = [
      "vc1": UIViewController.self,
      "vc2": NSObject.self
    ]
    return mapping
  }
  
  static let `default` = NetworkPlugin()
}

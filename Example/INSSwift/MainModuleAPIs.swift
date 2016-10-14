//
//  MainModuleAPIs.swift
//  INSSwift
//
//  Created by Dylan on 2016/10/12.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Foundation
import Moya

/// 在这里完成API的名称定义
enum MMAPI {
  case launch
  case signin(mobilePhoneNumber: String, password: String)
}

/// 在这里完成API所需信息补全
extension MMAPI: TargetType {
  var baseURL: URL {
    return URL(string: "http://leaf.leanapp.cn/api/")!
  }
  var path: String {
    switch self {
    case .launch:
      return "launch.json"
    case .signin:
      return "login"
    }
  }
  var method: Moya.Method {
    switch self {
    case .signin:
      return .POST
    default:
      return .GET
    }
  }
  var parameters: [String: Any]? {
    switch self {
    case .signin(let number, let password):
      return ["phone": number, "passwd": password]
    default:
      return nil
    }
  }
  var sampleData: Data {
    return Data(base64Encoded: "")!
  }
  
  var task: Task {
    return .request
  }
}

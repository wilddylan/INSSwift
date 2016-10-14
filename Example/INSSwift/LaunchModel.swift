//
//  LaunchModel.swift
//  INSSwift
//
//  Created by Dylan on 2016/10/12.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import INSSwift

class LaunchModel: Model {
  var bizUri: String?
  var domains: NSArray?
  var hotFixJS: String?
  var imageUri:String?
  var learningURL: String?
  var status: String?
  var version: String?
  
  override static func getPrimaryKey() -> String {
    return "version"
  }
  
  override static func getTableName() -> String {
    return "LaunchModel"
  }
}

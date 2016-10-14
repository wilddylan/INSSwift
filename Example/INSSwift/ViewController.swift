//
//  ViewController.swift
//  INSSwift
//
//  Created by Dylan on 10/08/2016.
//  Copyright (c) 2016 Dylan. All rights reserved.
//

import UIKit
import INSSwift
import Moya
import YYModel
import LKDBHelper

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    ModeSwitcher.currentMode = .develope
    Logger.level = .all
    
    let permissionTypes = [
      INSPermissionType.notification(nil, "打开推送服务"),
      INSPermissionType.camera("打开相机服务"),
      INSPermissionType.photos("希望使用照片")
    ]
    
    Permission.requestPermission(permissionTypes)
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}


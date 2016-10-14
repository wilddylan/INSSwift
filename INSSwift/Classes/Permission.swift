//
//  Permission.swift
//  Pods
//
//  Created by Dylan on 2016/10/10.
//
//

import Foundation
import PermissionScope

public enum INSPermissionType {
  case notification(Set<UIUserNotificationCategory>?, String)
  case locationAlways(String)
  case locationWhenInUse(String)
  case contact(String)
  case event(String)
  case microphone(String)
  case camera(String)
  case photos(String)
  case reminders(String)
  case bluetooth(String)
  case motion(String)
}

open class Permission {
  static let pscope: PermissionScope = {
    let permissionScope = PermissionScope()
    // Default customs
    permissionScope.headerLabel.text = "嗨，你好！"
    permissionScope.bodyLabel.text = "在使用我们的应用之前\n我们需要你做一些事情："
    permissionScope.closeButtonTextColor = UIColor.clear
    permissionScope.permissionButtonΒorderWidth = 0.5
    permissionScope.permissionButtonCornerRadius = 2
    /// 如果你希望更改权限开启按钮的英文，就需要自己配置本地化文件
    /// 参考这里 https://github.com/nickoneill/PermissionScope/pull/12#issuecomment-96428580
    return permissionScope
  }()
  
  open class func requestPermission(_ permissionTypes: [INSPermissionType], _ authChange: authClosureType? = nil, cancelled: cancelClosureType? = nil) {
    for item in permissionTypes {
      switch item {
      case .notification(let categories, let message):
        pscope.addPermission(NotificationsPermission(notificationCategories: categories), message: message)
        continue
      case .locationAlways(let message):
        pscope.addPermission(LocationWhileInUsePermission(), message: message)
        continue
      case .locationWhenInUse(let message):
        pscope.addPermission(LocationWhileInUsePermission(), message: message)
        continue
      case .contact(let message):
        pscope.addPermission(ContactsPermission(), message: message)
        continue
      case .event(let message):
        pscope.addPermission(EventsPermission(), message: message)
        continue
      case .microphone(let message):
        pscope.addPermission(MicrophonePermission(), message: message)
        continue
      case .camera(let message):
        pscope.addPermission(CameraPermission(), message: message)
        continue
      case .photos(let message):
        pscope.addPermission(PhotosPermission(), message: message)
        continue
      case .reminders(let message):
        pscope.addPermission(RemindersPermission(), message: message)
        continue
      case .bluetooth(let message):
        pscope.addPermission(BluetoothPermission(), message: message)
        continue
      case .motion(let message):
        pscope.addPermission(MotionPermission(), message: message)
        continue
      default:
        continue
      }
    }
    
    pscope.show(authChange, cancelled: cancelled)
  }
}

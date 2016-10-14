//
//  ModeSwitch.swift
//  Pods
//
//  Created by Dylan on 2016/10/10.
//
//

import Foundation

/// 开发模式
public enum Mode: String {
  /// 开发模式，打印日志，不上报日志
  case develope = "[DEVELOPE MODE]"
  /// 调试模式，关闭日志打印，上报日志
  case prepared = "[PREPARED MODE]"
  /// 生产模式，关闭日志打印，上报日志
  case production = "[PRODUCTION MODE]"
}

/// 模式控制
open class INSModeSwitch {
  /// 默认为调试模式
  open static let `default` = INSModeSwitch(.develope)
  
  open var currentMode: Mode {
    didSet {
    }
  }
  /// 私有初始化方法
  public init(_ mode: Mode) {
    self.currentMode = mode
  }
}

/// 模式选择器
public let ModeSwitcher = INSModeSwitch.default

//
//  Logger.swift
//  Pods
//
//  Created by Dylan on 2016/10/10.
//
//

import Foundation

/// 日志级别
public enum LogLevel: String {
  /// 打印所有类型日志
  case all = "\n🛢[ALL]"
  /// 仅打印调试日志
  case debug = "\n⚒[DEBUG]"
  /// 仅打印警告日志
  case warning = "\n❗️[WARN]"
  /// 仅打印信息日志
  case information = "\n📢[INFO]"
}

open class INSLogger {
  /// 默认为输出全部日志
  open static let `default` = INSLogger()
  
  /// 日志级别
  open var level: LogLevel = .all
  /// 是否上报崩溃
  open var crashCollect: Bool = true
  
  /// 日志输出
  ///
  /// - parameter lev: 日志级别
  /// - parameter content: 日志内容
  open func printLog(_ lev: LogLevel, _ details: String, _ items: Any) {
    guard level == .all || level == lev, ModeSwitcher.currentMode == .develope else {
      return
    }
    
    print(lev.rawValue, details, "\n", items)
    
    /// 根据Hybrid框架添加是否需要实时上报服务器
  }
  
  /// 设置异常捕获
  open func setUncaughtException() {
    NSSetUncaughtExceptionHandler {
      let exception = $0
      let name = exception.name
      let reason = exception.reason ?? "Without system crash version."
      let callStack = exception.callStackSymbols
      let crashLog = "name:\(name)\nreason:\(reason)\ncallStack:\(callStack.joined(separator: "\n"))"
      
      // TODO: 上报
      AnalyticsManager.track("CRASH", ["info": crashLog])
      AnalyticsManager.setNeedsRestoreItems()
      
      exception.raise()
    }
  }
  
  open func unSetUncaughtException() {
    NSSetUncaughtExceptionHandler(nil)
  }
}

/// 公开日志打印模块
public let Logger = INSLogger.default
/// 公开便捷调用方法
public func ILog(_ lev: LogLevel, _ items: Any, _ function: StaticString = #function, _ line: Int = #line, _ file: StaticString = #file) {
  var details = "[\("\(file)".components(separatedBy: "/").last!): \(function): \(line)]"
  Logger.printLog(lev, details, items)
}

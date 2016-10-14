//
//  Module.swift
//  Pods
//
//  Created by Dylan on 2016/10/10.
//
//

import Foundation
/// 数据流
public typealias INSDataFlowHandler = (Any...) ->Any
/// 错误的Scheme
fileprivate let INSDataUnknowedScheme = "INSDataUnknowedScheme_Key"

/// 插件协议
public protocol INSPlugin {
  var pluginLoaded: Bool { get }
  /// 插件唯一标识
  /// - returns: 插件标识，用来获取插件
  func pluginScheme() ->String!
  
  // MARK: - Mappings
  
  /// 视图控制器Map
  /// - returns: 视图控制器的对应字典
  func classMapping() ->Dictionary<String, AnyClass>?
  /// 数据流Map
  /// - returns: 数据流字典
  func dataflowMapping() ->Dictionary<String, INSDataFlowHandler>?
  
  // MARK: - Plugin status
  
  /// 当插件注册成功的时候会调用这个方法
  func serviceStarted()
  /// 当插件取消注册的时候会调用这个方法
  func serviceStopped()
}

extension INSPlugin {
  /// 插件加载状态
  public var pluginLoaded: Bool {
    return (ModuleCenter.getPlugin(for: pluginScheme()) != nil)
  }
}

/// 插件基类，成为模块插件管理器则必须继承该类，并实现方法
open class Plugin: INSPlugin {
  final public func registePlugin() {
    ModuleCenter.registePlugin(self)
  }
  
  final public func deRegistePlugin() {
    ModuleCenter.deRegistePlugin(self)
  }
  
  open func pluginScheme() -> String! {
    return nil
  }
  
  open func serviceStopped() {}
  
  open func serviceStarted() {}

  open func dataflowMapping() ->Dictionary<String, INSDataFlowHandler>? {
    return nil
  }

  open func classMapping() ->Dictionary<String, AnyClass>? {
    return nil
  }
  
  public init() {
    // I'm a plug-in manager 🏵
  }
}

/// 插件控制中心
open class ModuleManager: NSObject {
  open static let `default` = ModuleManager()
  /// 已经加载的插件
  private(set) var loadedPlugins: Dictionary<String, Plugin> = [:]
  
  /// 注册新的插件
  @discardableResult
  open func registePlugin(_ item: Plugin) ->Bool {
    guard let scheme = item.pluginScheme(), loadedPlugins[scheme] == nil else {
      return false
    }
    loadedPlugins[scheme] = item
    /// 注册组件
    item.serviceStarted()
    return true
  }
  
  /// 取消注册插件
  open func deRegistePlugin(_ item: Plugin) {
    guard let scheme = item.pluginScheme() else {
      return
    }
    loadedPlugins.removeValue(forKey: scheme)
    /// 移除组件
    item.serviceStopped()
  }
  
  /// 根据唯一标识获取插件
  open func getPlugin(for scheme: String) ->Plugin? {
    return loadedPlugins[scheme]
  }
  
  /// 数据流
  @discardableResult
  open func send(to url: String, and param: Any...) ->Any? {
    let (scheme, host) = validateURL(url)
    
    guard let pluginItem = getPlugin(for: scheme!), let dataMapping = pluginItem.dataflowMapping() else {
      ILog(.warning, "找不到scheme对应的插件或插件没有dataMapping!")
      return nil
    }
    
    guard let sendHandler = dataMapping[host!] else {
      ILog(.warning, "该路径没有对应的Handler")
      return nil
    }
    
    return sendHandler(param)
  }
  
  /// 视图流
  @discardableResult
  open func `class`(for url: String) ->AnyClass? {
    let (scheme, host) = validateURL(url)
    
    guard let pluginItem = getPlugin(for: scheme!), let dataMapping = pluginItem.classMapping() else {
      ILog(.warning, "找不到scheme对应的插件或插件没有classMapping!")
      return nil
    }
    
    return dataMapping[host!]
  }
  
  @discardableResult
  open func validateURL(_ url:String) ->(String?, String?) {
    guard let URLObject = URL(string: url), let scheme = URLObject.scheme else {
      ILog(.warning, "输入的url不能转换为URL对象或URL对象没有Scheme!")
      return (INSDataUnknowedScheme, "")
    }
    return (scheme, URLObject.host)
  }
  
  public override init() {
    // I'm a module manager 🏵
  }
}

public let ModuleCenter = ModuleManager.default

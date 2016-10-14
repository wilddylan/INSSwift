//
//  Database.swift
//  Pods
//
//  Created by Dylan on 2016/10/12.
//
//

import Foundation
import FMDB

open class INSDataBase {
  open var path: String
  private var dataBase: FMDatabase
  
  open func open() {}
  open func close() {}
  
  public init(_ path: String) {
    self.path = path
    self.dataBase = FMDatabase(path: path)
  }
}

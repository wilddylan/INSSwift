//
//  Person.swift
//  INSSwift
//
//  Created by Dylan on 2016/10/11.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import INSSwift

class Person: NSObject {
  var name: String = ""
  var gender : Bool = false
  var array: Array = [""]
  var dictionary: Dictionary<String, Any> = ["": ""]
  
  var student: Student = Student()
  var teachers: [Teacher] = []
  
  var ignored: String = ""
  
  override class func getTableName() ->String {
    
    return "PersonTable"
  }
}

class Student: NSObject {
  var sname: String = ""
  var sage: Int = 0
}

class Teacher: NSObject {
  var tname: String = ""
}

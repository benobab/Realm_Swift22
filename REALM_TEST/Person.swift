//
//  Person.swift
//  REALM_TEST
//
//  Created by Benobab on 18/06/16.
//  Copyright © 2016 Benobab. All rights reserved.
//

import Foundation
import RealmSwift

class Person:Object {
    dynamic var id:Int = 0
    dynamic var firstname:String = ""
    dynamic var lastname:String = ""
    dynamic var city:String = ""
    dynamic var newProperty:String = ""
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
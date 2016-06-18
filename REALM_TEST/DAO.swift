//
//  DAO.swift
//  REALM_TEST
//
//  Created by Benobab on 18/06/16.
//  Copyright © 2016 Benobab. All rights reserved.
//

import Foundation
import RealmSwift


class DAO {
    
    let realm = try! Realm()
    
    init(){
        
    }
    
    internal func getPersons() -> [Person]{
        //Return all the objects person, without any filters - Results<Person>
        let persons = realm.objects(Person.self)
        //Cast the results into an array
        var pers:Array<Person> = Array<Person>()
        pers.appendContentsOf(persons)
        return pers
    }
    
    internal func savePerson(person:Person){
        // Query and update from any thread
        dispatch_async(dispatch_queue_create("background", nil)) {
            try! self.realm.write {
                self.realm.add(person)
            }
        }
    }
    
    internal func loadPersonWithId(id:Int) -> Person{
        var p = Person()
        if let p =  realm.objects(Person.self).filter("id == \(id)").first{
            return p
        }
        return p
    }
    
}
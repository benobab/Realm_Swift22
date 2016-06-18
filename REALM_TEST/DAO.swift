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
        if  var p = loadPersonWithId(person.id) {
            //Updating the object
            try! self.realm.write {
                //Every property needs to be updated one by one (can't update like p = person unfortunately)
                p.city = person.city
                p.firstname = person.firstname
                p.lastname = person.lastname
            }
            return
        }
        //Creating the object
        try! self.realm.write {
            self.realm.add(person)
        }
    }
    
    internal func loadPersonWithId(id:Int) -> Person?{
        if let p =  realm.objects(Person.self).filter("id == \(id)").first{
            return p
        }
        return nil
    }
    
}
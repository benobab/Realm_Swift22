//: Playground - noun: a place where people can play

import UIKit
import RealmSwift
import Realm_Playground

@testable import Realm_Playground

var str = "Hello, playground"


let realm = try! Realm()

//Create a list of person
var persons:Array<Person> = Array<Person>()

for i in 1...10 {
    let p = Person()
    p.id = i
    p.firstname = "Manoooo - \(i)"
    p.lastname = "Yeah - \(i)"
    p.city = "City - \(i)"
    persons.append(p)
}

persons

//Save them into Realm
for p in persons {
    DAO().savePerson(p)
}

Realm.Configuration.defaultConfiguration.fileURL

//Retrieve them
DAO().loadPersonWithId(3)?.firstname
realm.objects(Person.self)[1].firstname

//Update one
if let p = DAO().loadPersonWithId(4) {
    try! realm.write {
        p.firstname = "Pinuts"
    }
}

//Object successfully updated
DAO().loadPersonWithId(4)?.firstname

//Delete an object
if let p = DAO().loadPersonWithId(2) {
    try! realm.write {
        realm.delete(p)
    }
}
//Object successfully deleted
DAO().getPersons().count



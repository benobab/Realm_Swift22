//
//  ViewController.swift
//  REALM_TEST
//
//  Created by Benobab on 18/06/16.
//  Copyright © 2016 Benobab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TEST
        let p = Person()
        p.id = 2
        p.firstname = "Ben"
        p.lastname = "Lacroixxxxx"
        p.city = "Hyeres"
        
        DAO().savePerson(p)
        
        let persons = DAO().getPersons()
        print(persons.count)
        if let person = DAO().loadPersonWithId(12){
            print(person.lastname)
        }
        //END TEST
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


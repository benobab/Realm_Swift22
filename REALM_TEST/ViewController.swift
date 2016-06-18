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
        p.firstname = "Ben"
        p.lastname = "Lacroix"
        p.city = "Hyeres"
        
        DAO().savePerson(p)
        
        let person = DAO().loadPersonWithId(12)
        print(person.lastname)
        //END TEST
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


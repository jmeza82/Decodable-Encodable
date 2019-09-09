//
//  EncodableViewController.swift
//  Decodable&Encodable
//
//  Created by Juan Meza on 8/19/19.
//  Copyright © 2019 Juan Meza. All rights reserved.
//

import UIKit
import Foundation

struct PersonEnc: Encodable {
    var firstname: String
    var lastname: String
    var age: Int
    
    init(firstname: String, lastname: String, age: Int) {
        self.firstname = firstname
        self.lastname = lastname
        self.age = age
    }
}

struct People: Encodable {
    var members: [PersonEnc]
    
    init(members: [PersonEnc]) {
        self.members = members
    }
}

class EncodableViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionEncodable(_ sender: Any) {
        
        
        do {
            
            let people = People(members: [PersonEnc(firstname: "John", lastname: "Doe", age: 20), PersonEnc(firstname: "Joe", lastname: "Ra", age: 22)])
            
            let encoded = try JSONEncoder().encode(people)
            print(people)
            print(encoded)
        
            
        } catch {
            print (error)
        }
    }
    
}

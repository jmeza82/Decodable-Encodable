//
//  ViewController.swift
//  Decodable&Encodable
//
//  Created by Juan Meza on 8/19/19.
//  Copyright © 2019 Juan Meza. All rights reserved.
//

import UIKit
import Foundation

struct Job: Decodable {
    var title: String
    var salary: Float
    
    init(title: String, salary: Float) {
        self.title = title
        self.salary = salary
    }
    
    enum CodingKeys: String, CodingKey {
        case title, salary
    }
}

struct Person: Decodable {
    var job: Job
    var firstName: String
    var lastName: String
    var age: Int
    
    init(job: Job, firstName: String, lastName: String, age: Int) {
        self.job = job
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    enum CodingKeys: String, CodingKey {
        case job = "job_information", firstName = "firstname", lastName = "lastname", age
    }
}

let rawData = """
{
    "job_information": {
        "title": "iOS Developer",
        "salary": 5000
    },
    "firstname": "John",
    "lastname": "Doe",
    "age": 20
}
""".data(using: .utf8)!



class ViewController: UIViewController {
    
    var persons = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            
                let person = try JSONDecoder().decode(Person.self, from: rawData)
                persons.append(person)
                print(person.firstName) // John
                print(person.lastName) // Doe
                print(person.job.title) // iOS Developer
                print(person.job.salary)
                print(person.age)
            
        } catch {
            print (error)
        }
       
       
    }
    

   

}

//
//  Student.swift
//  Week2-StudentsApp
//
//  Created by Rania Arbash on 2024-05-16.
//

import Foundation

class Student {
    // 1- add YOB
    var ID: Int
    var name : String
    var program : String
    var semester : String
    
    init() {
        ID = 0
        name = ""
        program = ""
        semester = ""
    }
    // 2 - update this init
    init(ID: Int, name: String, program: String, semester: String) {
        self.ID = ID
        self.name = name
        self.program = program
        self.semester = semester
    }
    
    
}

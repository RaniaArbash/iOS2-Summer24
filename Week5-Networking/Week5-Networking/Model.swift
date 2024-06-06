//
//  Model.swift
//  Week5-Networking
//
//  Created by Rania Arbash on 2024-06-06.
//

import Foundation

class Model : Decodable {
    var student : String = ""
    var version: String = ""
    var count: Int = 0
    var data : [Course] = [Course]()
}


class Course : Decodable{
    var id: Int = 0
    var courseCode: String = ""
    var courseName: String = ""
    var image: String = ""
}

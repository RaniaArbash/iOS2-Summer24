//
//  City.swift
//  WeatherApp-iOS2
//
//  Created by Rania Arbash on 2024-06-13.
//

import Foundation

class City : Decodable {
    var name: String = ""
    var state: String = ""
    var country : String = ""
    
    init(name: String, state: String, country: String) {
        self.name = name
        self.state = state
        self.country = country
    }
    
    func toString()->String {
        
        return "\(name),\(state),\(country)"
    }
}



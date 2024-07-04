//
//  WeatherModel.swift
//  WeatherApp-iOS2
//
//  Created by Rania Arbash on 2024-07-04.
//

import Foundation

class WeatherModel : Decodable {
    
    var weather : [WeatherObject] = [WeatherObject]()
    var main : MainObject = MainObject()
    var name : String = ""
}

class WeatherObject : Decodable {
    var main: String = ""
    var description = ""
    var icon = ""
}
class MainObject : Decodable {
    
    var temp = 0.0
    var feels_like = 0.0
}


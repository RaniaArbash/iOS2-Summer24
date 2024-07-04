//
//  NetworkingService.swift
//  WeatherApp-iOS2
//
//  Created by Rania Arbash on 2024-06-13.
//
import Foundation

protocol NetworkingDelegate{
    func networkingDidFinishWithCityList(cities : [City])
    func networkingDidFail()
}

class NetworkingService {
    static var shared = NetworkingService()
    
    var delegate : NetworkingDelegate?
    
    func getCitiesFromAPI(searchText : String) {
        let urlObj = URL(string:"http://gd.geobytes.com/AutoCompleteCity?&q=\(searchText)")!
        // this dataTask runs in background thread.
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            // if there is any error
            guard error == nil else {
                print("There is some networking error \(String(describing: error))")
                self.delegate?.networkingDidFail()
                return
            }
            /// if there is no error ===> if there is a good response (200)
            ///
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)else {
                print("There is incorrect response")
                self.delegate?.networkingDidFail()

                return
            }
            
            
            if let goodData = data {
                do {
                    let decoder = JSONDecoder()
                    var citiesList = try decoder.decode([String].self, from: goodData)
                    if citiesList[0] != "" {
                        let citiesObjects = self.createCityList(citiesList: citiesList)
                        print(citiesList.count)
                        //
                        DispatchQueue.main.async {
                            self.delegate?.networkingDidFinishWithCityList(cities: citiesObjects)
                            
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.delegate?.networkingDidFinishWithCityList(cities: [])
                        }
                        
                    }
            
                   
                    // this should be returned back to main thread.
                }catch {
                    
                    print (error)
                    
                }
            }
            
            /// // if there is a good response ===> we have the data object.
            
        }
        task.resume()
       
    }
    
    
    func createCityList(citiesList : [String])->[City]{
        var citiesObjects = [City]()
       
        for city in citiesList {
            var newparts = [String?]()
            var parts = city.components(separatedBy: ",")
            for part in parts {
                newparts.append(part.trimmingCharacters(in: .whitespaces))
            }
            if let p0 = newparts[0] , let p1 = newparts[1] , let p2 = newparts[2] {
                var cityObj = City(name: p0, state: p1, country: p2)
                citiesObjects.append(cityObj)
            }
            
        }
        return citiesObjects
    }
    
    
    func getWeatherInCity(city: String, completionHandler: @escaping (WeatherModel)->Void) {
        let urlObj = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=071c3ffca10be01d334505630d2c1a9c&units=metric")!
        // this dataTask runs in background thread.
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            // if there is any error
            guard error == nil else {
                print("There is some networking error \(String(describing: error))")
                self.delegate?.networkingDidFail()
                return
            }
            /// if there is no error ===> if there is a good response (200)
            ///
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)else {
                print("There is incorrect response")
                self.delegate?.networkingDidFail()
                
                return
            }
            
            
            if let goodData = data {
                let decoder = JSONDecoder()
                do{
                  var weatherObj =  try decoder.decode(WeatherModel.self, from: goodData)
                    DispatchQueue.main.async {
                        completionHandler(weatherObj)
                    }
                }
                catch {
                    print(error)
                }
            }
        }
        
        task.resume()
    }
    
    
}

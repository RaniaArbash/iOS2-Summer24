//
//  NetworkingService.swift
//  WeatherApp-iOS2
//
//  Created by Rania Arbash on 2024-06-13.
//
import Foundation

protocol NetworkingDelegate{
    
    func networkingDidFinishWithModel()
    func networkingDidFail()
    
}

class NetworkingService {
    
    static var shared = NetworkingService()
    
    var delegate : NetworkingDelegate?
    
    func getCitiesFromAPI(searchText : String){
        
       
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
                    
                    let citiesList = try decoder.decode([String].self, from: goodData)
                    print(citiesList.count)
                    
                    DispatchQueue.main.async {
                  //      self.delegate?.networkingDidFinishWithModel(studentData: studentModel)

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
    
    
}

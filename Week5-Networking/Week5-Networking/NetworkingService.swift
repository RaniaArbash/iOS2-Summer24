//
//  NetworkingService.swift
//  Week5-Networking
//
//  Created by Rania Arbash on 2024-06-06.
//

import Foundation

protocol NetworkingDelegate{
    
    func networkingDidFinishWithModel(studentData: Model)
    func networkingDidFail()
    
}

class NetworkingService {
    
    var delegate : NetworkingDelegate?
    
    func getCoursedDataFromAPI(){
        
       
        let urlObj = URL(string: "https://raw.githubusercontent.com/RaniaArbash/Networking_IOS/main/courses_data.json")!
        
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
//                    var jsonString = String(data: data!, encoding: .utf8)
//                    print(jsonString)
//
                    let decoder = JSONDecoder()
                    
                    let studentModel = try decoder.decode(Model.self, from: goodData)
                   
                    DispatchQueue.main.async {
                        self.delegate?.networkingDidFinishWithModel(studentData: studentModel)

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

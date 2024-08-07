//
//  WeatherViewController.swift
//  WeatherApp-iOS2
//
//  Created by Rania Arbash on 2024-07-04.
//

import UIKit

class WeatherViewController: UIViewController {

    
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    @IBOutlet weak var tempText: UILabel!
    
    
    @IBOutlet weak var descText: UILabel!
    
    
    @IBOutlet weak var feelsLikeText: UILabel!
    
    var selectedCity : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCity
        
        // Calling getWeatherInCity with Result completion handler
        NetworkingService.shared.getWeatherInCity(city: selectedCity) { result in
            switch result {
            case .success(let wo):
                self.descText.text = wo.weather[0].description
                           self.tempText.text = "\(wo.main.temp)"
                           self.feelsLikeText.text = "\(wo.main.feels_like)"
                let icon = wo.weather[0].icon
                           self.downloadTheImage(icon: icon)
                            break
                
            case .failure(let error):
                print(error)
                break
            
            }
            
            
        }
        
        
        // Calling getWeatherInCity with normal completion handler
//        NetworkingService.shared.getWeatherInCity(city: selectedCity) { wo in
//            self.descText.text = wo.weather[0].description
//            self.tempText.text = "\(wo.main.temp)"
//            self.feelsLikeText.text = "\(wo.main.feels_like)"
//            var icon = wo.weather[0].icon
//
//            self.downloadTheImage(icon: icon)
//        }
    }
    
    func downloadTheImage(icon:String) {
        var url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        var myQ = DispatchQueue(label: "MyQ")
        myQ.async {
            do {
                var imageData =  try Data(contentsOf: URL(string: url)!)
                DispatchQueue.main.async {
                    self.weatherImage.image = UIImage(data: imageData)
                }
            
            }catch {
                print (error)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

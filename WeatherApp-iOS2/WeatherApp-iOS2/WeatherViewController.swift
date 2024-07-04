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
        NetworkingService.shared.getWeatherInCity(city: selectedCity) { wo in
            self.descText.text = wo.weather[0].description
            self.tempText.text = "\(wo.main.temp)"
            self.feelsLikeText.text = "\(wo.main.feels_like)"
//            var icon = wo.weather[0].icon
//            var url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
//            var imageData =  Data(contentsOf: URL(string: url)!)
       //     weatherImage.image = UIImage(data: imageData)
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

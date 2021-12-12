//
//  ViewController.swift
//  Week6Lesson5
//
//  Created by Amani Atiah on 12/9/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!

    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(cityChanged), name: NSNotification.Name(rawValue: "cityValueChange"), object: nil)
        
        let params = ["id": "108410", "appid": "e31d2518130b6938e19e8c965c1db386"]

        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.value {
                let JSONDictionary = result as! NSDictionary
                let main = JSONDictionary["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                
                var pressure = main["pressure"] as! Double
                
                var humidity = main["humidity"] as! Double
                
                temp = temp - 272.15
                temp = Double(round(1000 * temp) / 1000)
                self.tempLabel.text = "\(temp)°"
                self.pressureLabel.text = "\(pressure)"
                self.humidityLabel.text! = "\(humidity)"
                
            }
        }
        
    }

    @objc func cityChanged(notification: Notification) {
        if let city = notification.userInfo?["city"] as? City {
            cityNameLabel.text = city.name
        }
    }
}


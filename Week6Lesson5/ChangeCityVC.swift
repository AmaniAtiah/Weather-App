//
//  ChangeCityVC.swift
//  Week6Lesson5
//
//  Created by Amani Atiah on 12/9/21.
//

import UIKit

class ChangeCityVC: UIViewController  {

    var citiesArray = [
        City(name: "الرياض", id: "108410"),
        City(name: "الدمام", id: "110336"),
        City(name: "جدة", id: "105343"),
        City(name: "ابها", id: "110690")

    ]
    
    var selectedCity: City?
    
    @IBOutlet weak var citiesPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
        
    }
   
    
    @IBAction func editCityButtonClicked(_ sender: Any) {
        if let city = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cityValueChange"), object: nil, userInfo: ["city" : city])
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ChangeCityVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        citiesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArray[row]
        
    }
}

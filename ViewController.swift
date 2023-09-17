//
//  ViewController.swift
//  Weather App
//
//  Created by SHYNU MARY VARGHESE on 2023-09-14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func submitButton(_ sender: Any) {
         var message = ""
        var location = cityTextField.text!
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + location + "/forecasts/latest"){
            let request = URLRequest(url: url)
            print(request)
            let task = URLSession.shared.dataTask(with: request) { [self] data, request, error in
                if let error = error{
                    print(error)
                }
                else
                {
                    
                    if let unWrappedData = data{
                        
                        let dataString = NSString(data: unWrappedData, encoding: String.Encoding.utf8.rawValue)
                       
                       var stringSepartator = "<h2>\(location) Weather Today</h2> (1&ndash;3 days)</div><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                        
                        
                        if let contentArray = dataString?.components(separatedBy: stringSepartator){
                            if contentArray.count>1{
                                               
                                stringSepartator = "</span>"
                                let newContentArray = contentArray[1].components(separatedBy: stringSepartator)
                                if newContentArray.count > 1{
                                    
                                    message = newContentArray[0]
                                    print(message)
                                }
                                
                                
                                
                            }
                        }
                    }
                }
                if message == ""
                {
                    message = "weather couldnt find for this location, please try again"
                }
                DispatchQueue.main.sync(execute: {
                    resultLabel.text = message
                })
            }
            
            task.resume()
        }
        else{
            resultLabel.text = "weather couldnt find, try later"
        }
         
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     /*   var message = ""
        //var location = cityTextField.text!
//        if let url = URL(string: "https://www.weather-forecast.com/locations/" + location + "/forecasts/latest"){
        if let url = URL(string: "https://www.weather-forecast.com/locations/London/forecasts/latest"){
            
            let request = URLRequest(url: url)
            print(request)
            let task = URLSession.shared.dataTask(with: request) { [self] data, request, error in
                if let error = error{
                    print(error)
                }
                else
                {
                    
                    if let unWrappedData = data{
                        
                        let dataString = NSString(data: unWrappedData, encoding: String.Encoding.utf8.rawValue)
                        var stringSepartator = "<h2>London Weather Today</h2> (1&ndash;3 days)</div><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                        
                        if let contentArray = dataString?.components(separatedBy: stringSepartator){
                            if contentArray.count>1{
                                               
                                stringSepartator = "</span>"
                                let newContentArray = contentArray[1].components(separatedBy: stringSepartator)
                                if newContentArray.count > 1{
                                    
                                    message = newContentArray[0]
                                    print(message)
                                }
                                
                                
                                
                            }
                        }
                    }
                }
                if message == ""
                {
                    message = "weather couldnt find for this location, please try again"
                }
                DispatchQueue.main.sync(execute: {
                    resultLabel.text = message
                })
            }
            
            task.resume()
        }
        else{
            resultLabel.text = "weather couldnt find, try later"
        }
 */
    }


}


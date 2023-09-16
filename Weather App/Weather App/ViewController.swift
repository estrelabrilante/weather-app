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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var message = ""
        guard let url = URL(string: "https://www.weather-forecast.com/locations/Winnipeg/forecasts/latest") else { return  }
        
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
                  
                    var stringSepartator = "Winnipeg Weather Today</h2> (1&ndash;3 days):</div><p class=\"location-summary__text\"><span class=\"phrase\">Mostly dry. Warm (max 25&deg;C on Mon afternoon, min 11&deg;C on Sat night). Winds increasing (light winds from the NNE on Sat afternoon, fresh winds from the S by Mon morning).</span>"
                    
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
               message = "weather couldnt find, please try again"
            }
            DispatchQueue.main.sync(execute: {
                resultLabel.text = message
            })
        }
        task.resume()
        
    }


}


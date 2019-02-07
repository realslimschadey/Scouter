//
//  ViewController.swift
//  Scouter
//
//  Created by Michael Schade on 1/8/19.
//  Copyright © 2019 Michael Schade. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var temp: String = ""
    var clickCount = 0
    
    @IBOutlet weak var team870Scouting: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func submitButton(_ sender: Any) {
        clickCount += 1
        temp = textField.text!
        team870Scouting.text = temp
        /**
        let url = URL(string: "http://54.210.236.166")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "id=13&name=Jack"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
        
    }
                **/
        
        /**
        struct Order: Codable {
            let customerId: String
            let items: [String]
        }
        
        // ...
        
        let order = Order(customerId: "12345",
                          items: ["Cheese pizza", "Diet soda"])
        guard let uploadData = try? JSONEncoder().encode(order) else {
            return
        }
        
        let url = URL(string: "http://54.210.236.166")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            
        }
        task.resume()
 
 **/
        let myUrl = URL(string: "http://54.210.236.166/hi.php");
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let postString = "firstName=James&lastName=Bond";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            print("response = \(String(describing: response))")
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    // Now we can access value of First Name by its key
                    let firstNameValue = parseJSON["firstName"] as? String
                    print("firstNameValue: \(String(describing: firstNameValue))")
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
        
    
}

}

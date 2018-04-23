
//  SecondViewController.swift
//  Waterboy
//
//  Created by Andrew Pokorny on 3/19/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit
import Reductio
import SwiftSoup
import Alamofire
//import GoogleAPIClientForREST

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstStory: UILabel!
    @IBOutlet weak var massivetitle: UILabel!
    @IBOutlet weak var datePasser: UITextField!
    
    var dateString = ""
    var realDate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dateString)
        if dateString == "Optional(0)" {
            let date = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: date)
            dateString = String(describing: components.day)
            realDate = components.day!
            let today = "67"
            datePasser.text = "67"
            let url2 = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/C" + today + "%3AC" + today + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
            
            Alamofire.request(url2, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
                if let result = response.result.value {
                    let result1 = String(result.characters.dropFirst(78))
                    let result2 = String(result1.characters.dropLast(9))
                    let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                    let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                    let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                    self.firstStory.numberOfLines = 0
                    self.firstStory.adjustsFontSizeToFitWidth = true
                    self.firstStory.text = trimmed3
                }
            }
            
            let url3 = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/A" + today + "%3AA" + today + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
            
            Alamofire.request(url3, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
                if let titleResult = response.result.value {
                    var result1 = String(titleResult.characters.dropFirst(78))
                    var result2 = String(result1.characters.dropLast(9))
                    let trimmed = result2.replacingOccurrences(of: "\"", with: "")
                    //print(result2)
                    self.massivetitle.numberOfLines=0
                    self.massivetitle.adjustsFontSizeToFitWidth = true
                    self.massivetitle.font = UIFont.boldSystemFont(ofSize: 18.0)
                    self.massivetitle.text = trimmed
                }
            }
            
            
            print(realDate)
        }
        else {
            let sheetNumber = Int(dateString)!
            print(sheetNumber)
            let sheetNumber1 = (Int(dateString)! * 3) - 2
            print(sheetNumber1)
            let sheetString1 = String(sheetNumber1)
            datePasser.text = sheetString1
            firstStory.numberOfLines = 0
            firstStory.adjustsFontSizeToFitWidth = true
            massivetitle.numberOfLines=0
            massivetitle.adjustsFontSizeToFitWidth = true
            var text1: String
            massivetitle.font = UIFont.boldSystemFont(ofSize: 18.0)
            
            let url2 = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/C" + sheetString1 + "%3AC" + sheetString1 + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
            
            
            Alamofire.request(url2, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
                if let result = response.result.value {
                    let result1 = String(result.characters.dropFirst(78))
                    let result2 = String(result1.characters.dropLast(9))
                    let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                    let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                    let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                    self.firstStory.text = trimmed3
                }
            }
            
            let url3 = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/A" + sheetString1 + "%3AA" + sheetString1 + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
            
            Alamofire.request(url3, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
                if let titleResult = response.result.value {
                    var result1 = String(titleResult.characters.dropFirst(78))
                    var result2 = String(result1.characters.dropLast(9))
                    let trimmed = result2.replacingOccurrences(of: "\"", with: "")
                    //print(result2)
                    self.massivetitle.text = trimmed
                }
            }
            
            text1 = "Boston Celtics point guard Kyrie Irving will not travel with the team as it begins its four-game trip so he can have a second opinion on his sore left knee.Celtics coach Brad Stevens made the announcement Tuesday and the team confirmed it in a tweet later.Irving has missed the Celtics' last three games and already has been ruled out for Tuesday's home game against Oklahoma City.He originally was diagnosed with tendinitis in his left knee and MRI results came back negative for any structural damage. Stevens did leave the door open to the possibility of Irving rejoining the team on the trip, depending on the results of the exam and how he's recovering. In his first season with the Celtics after being acquired from Cleveland, Irving is averaging 24.4 points and 5.1 assists in 60 games."
            
            Reductio.summarize(text: text1, compression: 0.50) { (phrases) in
                //  firstStory.text = phrases.description
                //   print(phrases)
            }
            
            let url = URL(string: "https://www.usatoday.com/story/sports/nba/celtics/2018/03/20/kyrie-irving-boston-celtics-knee-second-opinion/443921002/")
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        let htmlContent = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                        do{
                            let doc = try SwiftSoup.parse(htmlContent as! String)
                            do{
                                let element = try doc.select("title").first()
                                var text = try doc.select("p").array()
                                var text1 = try text[19].text()
                                for i in 20...25{
                                    let result = try text[i].append(text1).text()
                                    let r = try text[i]
                                    text1 = result
                                }
                                //print(text1)
                                //self.firstStory.text = text1
                                
                                do {
                                    let text = try element?.text()
                                    //    print (text)
                                    //self.massivetitle.text=text
                                }catch {
                                    
                                }
                            }catch {
                                
                            }
                            
                        }catch{
                            
                        }
                    }
                }
                else{
                    // print(error)
                }
            }
            task.resume()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let thirdViewController = segue.destination as! ThirdViewController
        thirdViewController.dateString = datePasser.text!
    }
    
}


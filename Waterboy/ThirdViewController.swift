
//  ThirdViewController.swift
//  Waterboy
//
//  Created by Andrew Pokorny on 3/20/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit
import Reductio
import AWSCore
import AWSDynamoDB
import Alamofire

class ThirdViewController: UIViewController {
    @IBOutlet weak var secondStory: UILabel!
    
    @IBOutlet weak var datePasser: UITextField!
    @IBOutlet weak var secondtitle: UILabel!
    var dateString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondStory.numberOfLines = 0
        secondStory.adjustsFontSizeToFitWidth = true;
        secondtitle.numberOfLines = 0
        secondtitle.adjustsFontSizeToFitWidth = true
        secondtitle.font = UIFont.boldSystemFont(ofSize: 18.0)
        print(dateString)
        let sheetNumber2 = (Int(dateString)!  + 1)
        print(sheetNumber2)
        let sheetString2 = String(sheetNumber2)
        datePasser.text = sheetString2
        let storyURL = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/C" + sheetString2 + "%3AC" + sheetString2 + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
        
        let titleURL = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/A" + sheetString2 + "%3AA" + sheetString2 + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
        
        Alamofire.request(storyURL, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
            if let result = response.result.value {
                let result1 = String(result.characters.dropFirst(78))
                let result2 = String(result1.characters.dropLast(9))
                let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                
                self.secondStory.text = trimmed3
            }
        }
        
        Alamofire.request(titleURL, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
            if let result = response.result.value {
                let result1 = String(result.characters.dropFirst(78))
                let result2 = String(result1.characters.dropLast(9))
                let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                
                self.secondtitle.text = trimmed3
            }
        }
        
        //secondStory.text = "While Vince McMahon promises to bring back a revamped XFL in 2020, a son of McMahon's partner in the original short-lived XFL venture said his football league will come first. And some big NFL names will be involved. Charlie Ebersol, who directed a documentary on the XFL that aired last year as part of ESPN's 30 for 30 series, announced Tuesday that his league, the Alliance of American Football, plans to debut Feb. 9, 2019, the week after Super Bowl LIII. The season will run 10 weeks and will have 50-man teams. Ebersol's father, Dick Ebersol, was McMahon's partner in the original XFL and is a longtime television executive. To help him steer the league, Charlie Ebersol brought on former NFL general manager Bill Polian, currently an analyst for ESPN. The player side will be overseen by former Pittsburgh Steelers safety Troy Polamalu, and the team side will be guided by former USC standout and executive J.K. McKay."
        
        //   Reductio.summarize(text: text2, compression: 0.40) {
        //     (phrases) in
        //    secondStory.text = phrases.description
        //     print(phrases)
        // }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let fourthViewController = segue.destination as! FourthViewController
        fourthViewController.dateString = datePasser.text!
    }
    
}


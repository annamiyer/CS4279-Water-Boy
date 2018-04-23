//
//  FifthViewController.swift
//  Waterboy
//
//  Created by Andrew Pokorny on 3/20/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit
import SwiftSoup
import Alamofire
import AWSCore
import AWSDynamoDB

class FifthViewController: UIViewController {

    @IBOutlet weak var ruleOfTheDay: UILabel!
    @IBOutlet weak var funFact: UILabel!

    var dateString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ruleOfTheDay.numberOfLines = 0
        funFact.numberOfLines = 0
        ruleOfTheDay.adjustsFontSizeToFitWidth = true
        funFact.adjustsFontSizeToFitWidth = true
        print(dateString)
        let sheetNumber4 = (Int(dateString)! - 1)
        let sheetString4 = String(sheetNumber4)
        let ruleURL = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/G" + sheetString4 + "%3AG" + sheetString4 + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
        
        Alamofire.request(ruleURL, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
            if let result = response.result.value {
                let result1 = String(result.characters.dropFirst(78))
                let result2 = String(result1.characters.dropLast(9))
                let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                self.ruleOfTheDay.numberOfLines = 0
                self.ruleOfTheDay.adjustsFontSizeToFitWidth = true
                self.ruleOfTheDay.text = trimmed3
            }
        }
        
        let factURL = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/G" + dateString + "%3AG" + dateString + "?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
        
        Alamofire.request(factURL, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
            if let result = response.result.value {
                let result1 = String(result.characters.dropFirst(78))
                let result2 = String(result1.characters.dropLast(9))
                let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                self.funFact.numberOfLines = 0
                self.funFact.adjustsFontSizeToFitWidth = true
                self.funFact.text = trimmed3
            }
        }
        
        
        let url = URL(string: "https://www.factmonster.com/sports/sports-section/sports-superstitions")
        let url2 = URL(string: "https://howtoadult.com/simple-basketball-rules-kids-4094.html")
        DispatchQueue.main.async {
            let html = try! String(contentsOf: url!, encoding: .utf8)
            let html2 = try! String(contentsOf: url2!, encoding: .utf8)

        do {
            let doc: Document = try SwiftSoup.parseBodyFragment(html)
            let doc2: Document = try SwiftSoup.parseBodyFragment(html2)
            let link: Element = try! doc.select("p").get(1)
            let link2: Element = try! doc2.select("p").get(1)

            print(link)
            //self.funFact.text = try link.text()
            //self.ruleOfTheDay.text = try link2.text()
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }

    }
    
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}

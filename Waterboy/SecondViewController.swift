//
//  SecondViewController.swift
//  Waterboy
//
//  Created by Andrew Pokorny on 3/19/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit
import Reductio
import SwiftSoup
import AWSCore
import AWSDynamoDB

class SecondViewController: UIViewController {

    @IBOutlet weak var firstStory: UILabel!
    @IBOutlet weak var massivetitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstStory.numberOfLines = 0
        firstStory.adjustsFontSizeToFitWidth = true
        massivetitle.numberOfLines=0
        massivetitle.adjustsFontSizeToFitWidth = true
        var text1: String
        var todayDate = Calendar.autoupdatingCurrent
        var resultURL : String
        var resultTitle :String
        
        
        /*dynamoDBObjectMapper.load(WaterboyArticles.self, hashKey: todayDate, rangeKey:nil).continueWith(block: { (task:AWSTask<AnyObject>!) -> Any? in
            if let error = task.error as? NSError {
                print("The request failed. Error: \(error)")
            } else if let resultBook = task.result as? Book {
                resultURL = task.result
                resultTitle = task.result
                // Do something with task.result.
            }
            return nil
        })
        */
        
        
        

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
                            print(text1)
                            self.firstStory.text = text1
                            
                            do {
                                let text = try element?.text()
                           //    print (text)
                                self.massivetitle.text=text
                            }catch {
                                
                            }
                        }catch {
                            
                        }
                        
                    }catch{
                        
                    }
                }
            }
            else{
                print(error)
                
            }
        }
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
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

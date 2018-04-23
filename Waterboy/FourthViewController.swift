//
//  FourthViewController.swift
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

class FourthViewController: UIViewController {
    @IBOutlet weak var thirdStory: UILabel!
    
    @IBOutlet weak var storytitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        storytitle.numberOfLines=0
        storytitle.adjustsFontSizeToFitWidth = true
        thirdStory.numberOfLines = 0
        thirdStory.adjustsFontSizeToFitWidth = true
        storytitle.font = UIFont.boldSystemFont(ofSize: 18.0)

        let storyURL = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/C4%3AC4?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
        
        let titleURL = "https://sheets.googleapis.com/v4/spreadsheets/1iGIyo-q-gbKenMFKVDoO9UCHIEZukVlm7JAZokPy8dE/values/A4%3AA4?key=AIzaSyA47HxY_lhwJGKL-OV1ixJZ2fFjRiaVYLI"
        
        Alamofire.request(storyURL, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
            if let result = response.result.value {
                let result1 = String(result.characters.dropFirst(78))
                let result2 = String(result1.characters.dropLast(9))
                let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                
                self.thirdStory.text = trimmed3
            }
        }
        
        Alamofire.request(titleURL, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseString { response in
            if let result = response.result.value {
                let result1 = String(result.characters.dropFirst(78))
                let result2 = String(result1.characters.dropLast(9))
                let trimmed = result2.replacingOccurrences(of: "[[\"\\]]", with: "", options: .regularExpression)
                let trimmed2 = trimmed.replacingOccurrences(of: "\"", with: "")
                let trimmed3 = trimmed2.replacingOccurrences(of: "\\", with: "")
                
                self.storytitle.text = trimmed3
            }
        }
        
        //storytitle.text = "Desiree Linden first American woman to win Boston Marathon since 1985"


      /*  text3 = "Los Angeles Dodgers third baseman Justin Turner will not need surgery on his injured left wrist, manager Dave Roberts told reporters Tuesday. Turner suffered a non-displaced fracture in his wrist when he was hit by a pitch in the Dodgers' spring training game Monday night against the Oakland Athletics. Roberts did not reveal a timeline for how long Turner will be sidelined, although the Dodgers' manager acknowledged Monday night that weeks are involved when you're talking about a fracture of any sort. Turner told MLB.com on Tuesday that his wrist will be in a brace for a few days before he can start range-of-motion exercises, saying that avoiding surgery is good news. With Opening Day just nine days away, the Dodgers seem likely to slide Logan Forsythe to third base in Turner's absence, with Chase Utley and Kike Hernandez splitting regular duty at second base. Turner, 33, batted .322 with 21 homers and 71 RBIs last season."
        
        Reductio.summarize(text: text3, compression: 0.80) { (phrases)
            in
            thirdStory.text = phrases.description
            print(phrases)
        } */
        
        //thirdStory.text = "BOSTON -- Desiree Linden splashed her way through icy rain and a near-gale headwind to a Boston Marathon victory on Monday, the first American woman to win the race since 1985.The two-time Olympian and 2011 Boston runner-up pulled away at the end of Heartbreak Hill to finish in 2 hours, 39 minutes, 54 seconds. That was more than four minutes better than second-place finisher Sarah Sellers, one of seven Americans in the top 10, but the slowest time for a women's winner since 1978.It's supposed to be hard, said Linden, who wiped the spray of rain from her eyes as she made her way down Boylston Street alone. 'It's good to get it done.'"
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

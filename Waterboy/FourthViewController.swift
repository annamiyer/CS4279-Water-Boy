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

class FourthViewController: UIViewController {
    @IBOutlet weak var thirdStory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thirdStory.numberOfLines = 0
        thirdStory.adjustsFontSizeToFitWidth = true
        var text3: String
        
        text3 = "Los Angeles Dodgers third baseman Justin Turner will not need surgery on his injured left wrist, manager Dave Roberts told reporters Tuesday. Turner suffered a non-displaced fracture in his wrist when he was hit by a pitch in the Dodgers' spring training game Monday night against the Oakland Athletics. Roberts did not reveal a timeline for how long Turner will be sidelined, although the Dodgers' manager acknowledged Monday night that weeks are involved when you're talking about a fracture of any sort. Turner told MLB.com on Tuesday that his wrist will be in a brace for a few days before he can start range-of-motion exercises, saying that avoiding surgery is good news. With Opening Day just nine days away, the Dodgers seem likely to slide Logan Forsythe to third base in Turner's absence, with Chase Utley and Kike Hernandez splitting regular duty at second base. Turner, 33, batted .322 with 21 homers and 71 RBIs last season."
        
        Reductio.summarize(text: text3, compression: 0.80) { (phrases)
            in
            thirdStory.text = phrases.description
            print(phrases)
        }
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

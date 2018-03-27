//
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

class ThirdViewController: UIViewController {
    @IBOutlet weak var secondStory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondStory.numberOfLines = 0
        secondStory.adjustsFontSizeToFitWidth = true;
        var text2: String
        
        text2 = "While Vince McMahon promises to bring back a revamped XFL in 2020, a son of McMahon's partner in the original short-lived XFL venture said his football league will come first. And some big NFL names will be involved. Charlie Ebersol, who directed a documentary on the XFL that aired last year as part of ESPN's 30 for 30 series, announced Tuesday that his league, the Alliance of American Football, plans to debut Feb. 9, 2019, the week after Super Bowl LIII. The season will run 10 weeks and will have 50-man teams. Ebersol's father, Dick Ebersol, was McMahon's partner in the original XFL and is a longtime television executive. To help him steer the league, Charlie Ebersol brought on former NFL general manager Bill Polian, currently an analyst for ESPN. The player side will be overseen by former Pittsburgh Steelers safety Troy Polamalu, and the team side will be guided by former USC standout and executive J.K. McKay."
        
        Reductio.summarize(text: text2, compression: 0.40) {
            (phrases) in
            secondStory.text = phrases.description
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

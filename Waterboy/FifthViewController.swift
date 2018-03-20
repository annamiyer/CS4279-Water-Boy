//
//  FifthViewController.swift
//  Waterboy
//
//  Created by Andrew Pokorny on 3/20/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var ruleOfTheDay: UILabel!
    @IBOutlet weak var funFact: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        ruleOfTheDay.numberOfLines = 0
        funFact.numberOfLines = 0
        ruleOfTheDay.adjustsFontSizeToFitWidth = true
        funFact.adjustsFontSizeToFitWidth = true
        var rule: String
        rule = "College basketball plays two, 20-minute halves"
        ruleOfTheDay.text = rule
        var fact: String
        fact = "Barry Bonds is the all-time homerun leader."
        funFact.text = fact

        // Do any additional setup after loading the view.
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

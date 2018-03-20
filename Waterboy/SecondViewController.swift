//
//  SecondViewController.swift
//  Waterboy
//
//  Created by Andrew Pokorny on 3/19/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit
import Reductio

class SecondViewController: UIViewController {

    @IBOutlet weak var firstStory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstStory.numberOfLines = 0
        firstStory.adjustsFontSizeToFitWidth = true
        var text1: String

        text1 = "Oculus rarely brags about its industrial design, but one of the best things it’s done is make something so stereotypically geeky look (relatively) natural. The $599 consumer Rift is full of clever and thoughtful touches, starting with the delightfully soft rubberized carrying case it ships in, which makes the whole thing feel like a cyberpunk hacker’s console. The all-black headset is downright understated by gaming hardware standards, with a front of smooth rubber, sides coated in coarse cloth, and lenses surrounded by a web of lycra. It’s tethered to a PC by a single wire, which runs out your left temple and along one of the adjustable side straps. William Gibson’s best-known foray into virtual reality might be Neuromancer, but the Rift feels more like something from his design-obsessed novel Pattern Recognition — it’s the kind of minimalist product that its brand-allergic, coolhunting protagonist Cayce Pollard might approve of. Getting the Rift to fit right can prove elusive at first. While there’s a small focus knob at the bottom, a lot of the screen’s clarity depends on precisely how it’s angled toward your eyes, and it’s easy to give yourself a headache by strapping it as tightly as possible to keep the best fit. But once you get used to wearing it, the headset feels lighter and more comfortable than most of its competition, sealing against your face with a firm but pliable ring of foam. Since I have yet to break a sweat in the Rift, I can’t say how easy it is to clean, but the ring is removable and replaceable — although there’s no spare included. I also don’t have to deal with wearing glasses, but my Verge colleagues who do have had a positive response — they could either fit the headset over moderately-sized frames or, depending on their prescription, get the screen in focus without them. "
        
        Reductio.summarize(text: text1, compression: 0.80) { (phrases) in
            firstStory.text = phrases.description
            print(phrases)
        }
        //var text3 = text2.description
        //firstStory.text = "Need to figure out how to put the story here"
        
        
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

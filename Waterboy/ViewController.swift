//
//  ViewController.swift
//  Waterboy
//
//  Created by Annam Iyer on 1/30/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit
import Alamofire
import Unirest
import Reductio
import SwiftSoup
import AWSCore
import AWSDynamoDB

class ViewController: UIViewController {

  @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var components = DateComponents()
        components.day = -14
        let minDate = Calendar.current.date(byAdding: components, to: Date())
        
        components.day = 0
        let maxDate = Calendar.current.date(byAdding: components, to: Date())
        
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        
        let url = URL(string: "https://www.usatoday.com/story/sports/nba/celtics/2018/03/20/kyrie-irving-boston-celtics-knee-second-opinion/443921002/")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error)
            }
            else{
                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
               // print(htmlContent)
                
                do{
                    let doc = try SwiftSoup.parse(htmlContent as! String)
                    do{
                        let element = try doc.select("title").first()
                        do {
                            let text = try element?.text()
                            print (text)
                        }catch {
                            
                        }
                    }catch {
                        
                    }
                    
                }catch{
                    
                }
            }
        }
        
        task.resume()
        
        //let htmlContent2 =
        
//        let text1 = "Oculus rarely brags about its industrial design, but one of the best things it’s done is make something so stereotypically geeky look (relatively) natural. The $599 consumer Rift is full of clever and thoughtful touches, starting with the delightfully soft rubberized carrying case it ships in, which makes the whole thing feel like a cyberpunk hacker’s console. The all-black headset is downright understated by gaming hardware standards, with a front of smooth rubber, sides coated in coarse cloth, and lenses surrounded by a web of lycra. It’s tethered to a PC by a single wire, which runs out your left temple and along one of the adjustable side straps. William Gibson’s best-known foray into virtual reality might be Neuromancer, but the Rift feels more like something from his design-obsessed novel Pattern Recognition — it’s the kind of minimalist product that its brand-allergic, coolhunting protagonist Cayce Pollard might approve of. Getting the Rift to fit right can prove elusive at first. While there’s a small focus knob at the bottom, a lot of the screen’s clarity depends on precisely how it’s angled toward your eyes, and it’s easy to give yourself a headache by strapping it as tightly as possible to keep the best fit. But once you get used to wearing it, the headset feels lighter and more comfortable than most of its competition, sealing against your face with a firm but pliable ring of foam. Since I have yet to break a sweat in the Rift, I can’t say how easy it is to clean, but the ring is removable and replaceable — although there’s no spare included. I also don’t have to deal with wearing glasses, but my Verge colleagues who do have had a positive response — they could either fit the headset over moderately-sized frames or, depending on their prescription, get the screen in focus without them. Along with a cylindrical black tracking camera on a slender 8-inch stand, the Rift comes with two accessories: an Xbox One gamepad and a small, simple device called the Oculus Remote. Unlike Sony and HTC, Oculus isn’t launching the Rift with a full controller of its own, since its Oculus Touch hardware will arrive in the second half of this year. For now, the chunky and colorful Xbox gamepad seems slightly out of place alongside the sleek Rift design. The oval-shaped black remote, by contrast, fits right in, although its construction doesn’t feel as solid as the rest of the system. The Rift is something I’d be happy to have in my living room, and compared to the developer-focused Oculus devices of years past, it’s a breeze to set up. The 4-meter headset tether ends with one USB and one HDMI port, and the tracking camera is plugged in with its own USB cable — there’s no external power cable or controller box for either piece. You’ll just download Oculus’ Windows app and run through a short, though descriptive, setup checklist before getting into VR. Granted, getting to this point requires having a powerful gaming desktop, which can produce plenty of glitches on its own. And since most PCs have only one HDMI port, you’ll need to use a different connection for your monitor, an extra and not totally intuitive step for many people. For the most part, though, it’s as easy as I can imagine installing a totally new kind of computer hardware to be."
        
 //       Reductio.summarize(text: text1, compression: 0.80) { (phrases) in
 //           print(phrases)
 //       }
        
        
        
/*
        Alamofire.request("https://codewithchris.com/code/afsample.json")
        
         Alamofire.request("https://codewithchris.com/code/afsample.json").responseJSON { (response ) -> Void in
            
            if let JSON = response.result.value {
                print(JSON)
            }
        }

 
        let parameters = [
            "sentnum" : "5",
            "url" : "http://en.wikipedia.org/wiki/Automatic_summarization"]
        let headers = [
            "X-Mashape-Key" : "m3vVRZY6vmmshmUO7xssD6q3zp0Zp1pxzmnjsn88Sn5M71YIJo",
            "Content-Type" : "application/x-www-form-urlencoded",
            "Accept" : "application/json"]
        let apiToContact = "https://textanalysis-text-summarization.p.mashape.com/text-summarizer-url"
        Alamofire.request(apiToContact, parameters:parameters, headers:headers).responseJSON {
             (responseURL) -> Void in
            if let JSON = responseURL.result.value {
                print(JSON)
            }
        }
        
*/
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    func performGetRequest(targetURL: NSURL!, completion: @escaping (_ data: NSData?, _ HTTPStatusCode: Int, _ error: NSError?) -> Void) {
        let request = NSMutableURLRequest(url: targetURL as URL)
        request.httpMethod = "GET"
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfiguration)
        
        let task = session.dataTaskWithRequest(request as URLRequest, completionHandler: { (data: NSData!, response: URLResponse!, error: NSError!) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(data, (response as! HTTPURLResponse).statusCode, error)
            })
        })
        
        task.resume()
    }

    // These code snippets use an open-source library. http://unirest.io/objective-c
    NSDictionary *headers = @{@"X-Mashape-Key": @"aeP5nTtItCmshz0VeGaMqW1wunuLp1IHmRSjsnuftoEbh0fZen", @"Content-Type": @"application/x-www-form-urlencoded", @"Accept": @"application/json"};
    NSDictionary *parameters = @{@"sentnum": @(6), @"url": @"http://en.wikipedia.org/wiki/Automatic_summarization"};
    UNIUrlConnection *asyncConnection = [[UNIRest post:^(UNISimpleRequest *request) {
    [request setUrl:@"https://textanalysis-text-summarization.p.mashape.com/text-summarizer-url"];
    [request setHeaders:headers];
    [request setParameters:parameters];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
    NSInteger code = response.code;
    NSDictionary *responseHeaders = response.headers;
    UNIJsonNode *body = response.body;
    NSData *rawBody = response.rawBody;
    }];
 **/
    
}


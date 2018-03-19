//
//  ViewController.swift
//  Waterboy
//
//  Created by Annam Iyer on 1/30/18.
//  Copyright © 2018 Annam Iyer. All rights reserved.
//

import UIKit
import Alamofire

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


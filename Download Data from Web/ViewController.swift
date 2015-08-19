//
//  ViewController.swift
//  Download Data from Web
//
//  Created by kodejs on 8/20/15.
//  Copyright © 2015 kodejs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        // nsurlsession seperti membuka browser, dan sharedsession seperti buka tab
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            // kondisi ketika selesai download data
            if let urlContent = data {
                // jika ada data maka jadikan sebagai urlContent
                print(urlContent)
            }else {
                // jika ada error
            }
        }
        
        task.resume()
        // Pada awalnya akan ada sedikit masalah dengan koneki yang menggunakan http, jadi kita perlu sedikit melakukan penambahan di info.plist
        // NSAppTranportSecurity type dictionary
        // NSAllowsArbitraryLoads boolean yes
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


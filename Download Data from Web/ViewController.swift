//
//  ViewController.swift
//  Download Data from Web
//
//  Created by kodejs on 8/20/15.
//  Copyright © 2015 kodejs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        // nsurlsession seperti membuka browser, dan sharedsession seperti buka tab
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            // kondisi ketika selesai download data
            if let urlContent = data {
                // jika ada data maka jadikan sebagai urlContent
                
                // data pada urlcontent maih ter encode, agar mudah dibaca kita perlu me-encode
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                print(webContent)
                
                // terkadang butuh waktu cukup lama, jadi kita perlu membuatnya agar sync
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    // sekarang tampilkan pada webview
                    self.webView.loadHTMLString(String(webContent), baseURL: nil)
                })
                
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


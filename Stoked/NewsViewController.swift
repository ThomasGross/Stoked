//
//  NewsViewController.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 11/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit


class NewsViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var SideMenuButton: UIBarButtonItem!
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        SideMenuButton.target = self.revealViewController()
        SideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
        
        webView.delegate = self
        if let url = URL(string: "http://www.dsrf.dk/nyheder/") {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
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

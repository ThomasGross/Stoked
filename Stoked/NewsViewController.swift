//
//  NewsViewController.swift
//  Stoked
//
//  Created by Thomas Rasmussen on 11/11/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit


class NewsViewController: UIViewController {

    @IBOutlet weak var SideMenuButton: UIBarButtonItem!
    
    var jsonWeatherService = JsonWeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        SideMenuButton.target = self.revealViewController()
        SideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
        
        jsonWeatherService.getWeatherForLocation(id: 5)
        
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

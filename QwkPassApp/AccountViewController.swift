//
//  AccountViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/24/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    @IBOutlet weak var AccountNav: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AccountNav.barTintColor = UIColor(red:0.27, green:0.56, blue:0.90, alpha:1.0)// Set any colour
        AccountNav.isTranslucent = false
        
        AccountNav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
        barView.backgroundColor = UIColor(red:0.27, green:0.56, blue:0.90, alpha:1.0)
        view.addSubview(barView)
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

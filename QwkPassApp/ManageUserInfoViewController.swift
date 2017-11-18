//
//  ManageUserInfoViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 10/29/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit

class ManageUserInfoViewController: UIViewController {

    @IBOutlet weak var EditEmail: UITextField!
    @IBOutlet weak var ConfirmPassEdit: UITextField!
    @IBOutlet weak var EditPassword: UITextField!
    @IBOutlet weak var EditUserName: UITextField!
    
    @IBOutlet weak var EditUserNav: UINavigationBar!
    
    
    override func viewDidLoad() {
        
        EditUserNav.barTintColor = UIColor(red:0.27, green:0.56, blue:0.90, alpha:1.0)// Set any colour
        EditUserNav.isTranslucent = false
        
        EditUserNav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
        barView.backgroundColor = UIColor(red:0.27, green:0.56, blue:0.90, alpha:1.0)
        view.addSubview(barView)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveEdits(_ sender: Any) {
        
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

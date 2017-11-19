//
//  ScheduleViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/24/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var ScheduleNav: UINavigationBar!
    
    @IBOutlet weak var scheduleSelect: UISegmentedControl!
    
    @IBOutlet weak var scheduleImage: UIImageView!
    
    @IBAction func scheduleSelectAction(_ sender: UISegmentedControl) {
        scheduleImage.image = UIImage(named: "Bart Schedule");
        if scheduleSelect.selectedSegmentIndex == 0 {
            scheduleImage.image = UIImage(named: "Bart Schedule")
        }
            
        else if scheduleSelect.selectedSegmentIndex == 1 {
            scheduleImage.image = UIImage(named: "Caltrain Schedule")
        }
            
        else if scheduleSelect.selectedSegmentIndex == 2 {
            scheduleImage.image = UIImage(named: "VTA Schedule")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ScheduleNav.barTintColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)// Set any colour
        ScheduleNav.isTranslucent = false
        
        ScheduleNav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
        barView.backgroundColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)
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

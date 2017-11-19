//
//  MapsViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/24/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {

    @IBOutlet weak var MapsNav: UINavigationBar!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var mapSegmentedControl: UISegmentedControl!

    @IBAction func mapSegmentedControl(_ sender: UISegmentedControl) {

        if mapSegmentedControl.selectedSegmentIndex == 0 {
            mapImage.image = UIImage(named: "BART_cc_map")
        }
            
        else if mapSegmentedControl.selectedSegmentIndex == 1 {
            mapImage.image = UIImage(named: "CaltrainMap")
        }
            
        else if mapSegmentedControl.selectedSegmentIndex == 2 {
            mapImage.image = UIImage(named: "VTAmap")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        MapsNav.barTintColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)// Set any colour
        MapsNav.isTranslucent = false
        
        MapsNav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
        
        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
        barView.backgroundColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)
        view.addSubview(barView)
        // Do any additional setup after loading the view.
        
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

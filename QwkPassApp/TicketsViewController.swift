//
//  TicketsViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/24/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import Firebase

class TicketsViewController: UIViewController {
    
    
    var usernamePassed = String()
    var ref: DatabaseReference!
    
    @IBOutlet weak var UserInfo: UILabel!
    @IBOutlet weak var TicketsNav: UINavigationBar!
    @IBOutlet weak var QR_Image: UIImageView!
    @IBOutlet weak var Ticket_Background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TicketsNav.barTintColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)// Set any colour
        TicketsNav.isTranslucent = false
        
        TicketsNav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
        barView.backgroundColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)
        view.addSubview(barView)
        
        
        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("Users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if !snapshot.exists() { return }
            
            print(snapshot)
            let value = snapshot.value as? NSDictionary
            let username = value?["Username"] as? String ?? ""
            
            self.UserInfo.text = "\(username)'s"
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            let user = Auth.auth().currentUser
            if let user = user {
                let uid = user.uid
                //self.UserInfo.text =
//                let email = user.email
//                self.UserEmail.text = email
                
                let data = uid.data(using: .ascii, allowLossyConversion: false) //takes our text and encodes to ascii encoding
                let filter = CIFilter(name: "CIQRCodeGenerator")  //can switch this between QR code or Bar code
                filter?.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 15, y: 15)
                
                let img = UIImage(ciImage: (filter?.outputImage?.applying(transform))!)   //creates an image based on the
                
                QR_Image.image = img
                
            }
            
        }
        else {
            print("No User Info");
            // No user is signed in.
            // ...
        }
        // Do any additional setup after loading the view.
        // self.Ticket_Background.layer.cornerRadius = 30
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

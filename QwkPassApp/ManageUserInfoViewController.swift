//
//  ManageUserInfoViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 10/29/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import Firebase

class ManageUserInfoViewController: UIViewController {

    @IBOutlet weak var EditEmail: UITextField!
    @IBOutlet weak var ConfirmPassEdit: UITextField!
    @IBOutlet weak var EditPassword: UITextField!
    @IBOutlet weak var EditUserName: UITextField!
    
    @IBOutlet weak var EditUserNav: UINavigationBar!
    
     var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        
        EditUserNav.barTintColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)// Set any colour
        EditUserNav.isTranslucent = false
        
        EditUserNav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
        barView.backgroundColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)
        view.addSubview(barView)
        
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
        
        }
        
        let user = Auth.auth().currentUser
        if let user = user {
            let email = user.email
            EditEmail.text = email
        }
        
        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("Users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if !snapshot.exists() { return }
            
            print(snapshot)
            let value = snapshot.value as? NSDictionary
            let username = value?["Username"] as? String ?? ""
            
            self.EditUserName.text = username
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
       
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        //Firebase - Listen for authentication state
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ....
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
//    if Auth.auth().currentUser != nil {
//    // User is signed in.
//    // ...
//    } else {
//    // No user is signed in.
//    // ...
//    }
//
//    Auth.auth().currentUser?.updateEmail(to: email) { (error) in
//    // ...
//    }
//
//    Auth.auth().currentUser?.updatePassword(to: password) { (error) in
//    // ...
//    }
//
    
    
    @IBAction func SaveEdits(_ sender: Any) {
        
        ref = Database.database().reference()
        Auth.auth().currentUser?.updateEmail(to: EditEmail.text!) { (error) in
            // ...
        }
        if(ConfirmPassEdit.text! == EditPassword.text!){
            Auth.auth().currentUser?.updatePassword(to: EditPassword.text!) { (error) in
            // ...
            }
            
        }
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            self.ref.child("Users").child((user?.uid)!).child("Email").setValue(self.EditEmail.text)
            self.ref.child("Users").child((user?.uid)!).child("Username").setValue(self.EditUserName.text)
        }
        
        self.dismiss(animated: true, completion: nil)
        
        
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

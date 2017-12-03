//
//  RegisterBillingViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/30/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import Stripe

class RBVC: UIViewController, STPPaymentCardTextFieldDelegate {

//    @IBOutlet weak var Email: UILabel!
//    @IBOutlet weak var Pass: UILabel!
//    @IBOutlet weak var CPass: UILabel!
//
    
    @IBOutlet weak var paymentTextField: STPPaymentCardTextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    var emailPassed = String()
    var passwordPassed = String()
    var confpassPassed = String()
    var usernamePassed = String()
    
//    @IBOutlet weak var NameOnCard: UITextField!
//    @IBOutlet weak var CardNumber: UITextField!
//    @IBOutlet weak var Expiry: UITextField!
//    @IBOutlet weak var CVV: UITextField!
//    @IBOutlet weak var ZipCode: UITextField!
//    @IBOutlet weak var StreetName: UITextField!
//    @IBOutlet weak var City: UITextField!
//    @IBOutlet weak var State: UITextField!
    
    
    var ref: DatabaseReference!
    
    //email.text = emailPassed
    //password.text = passwordPassed
    //Work on this https://code.tutsplus.com/tutorials/ios-sdk-passing-data-between-controllers-in-swift--cms-27151
    
    
    //Text Fields
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Email.text = emailPassed
//        Pass.text = passwordPassed
//        CPass.text = confpassPassed
        
        paymentTextField.delegate = self
        
        self.RegisterButton.isEnabled = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        RegisterButton.isEnabled = textField.isValid
        if(textField.isValid){
            textField.resignFirstResponder()
        }
    }
    
//    @IBAction func submitCard(_ sender: Any) {
//        ref = Database.database().reference()
//        // If you have your own form for getting credit card information, you can construct
//        // your own STPCardParams from number, month, year, and CVV.
//        let cardParams = paymentTextField.cardParams
//        
//        STPAPIClient.shared().createToken(withCard: cardParams) { token, error in
//            guard let stripeToken = token else {
//                NSLog("Error creating token: %@", error!.localizedDescription);
//                return
//            }
//            
//            // TODO: send the token to your server so it can create a charge
//            let alert = UIAlertController(title: "Welcome to Stripe", message: "Token created: \(stripeToken)", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Registration_to_Sign_In" {
            if authverified == false {
                return false
            }
            else{
                print("Register Segue will occur")
                performSegue(withIdentifier: "Registration_to_Sign_In", sender: self)
            }
        }
        
        return true
    }
    
    
    
    var authverified = false
    
    @IBAction func RegisterButton(_ sender: Any) {
        
        ref = Database.database().reference()
        Auth.auth().createUser(withEmail: emailPassed, password: passwordPassed) { (user, error) in
            if let error = error {
                self.showToast(message: error.localizedDescription)
                print(error.localizedDescription)
                return
            }
            self.authverified = true
            
//            
//           let key = self.ref.child("Users").childByAutoId().key
//           let post = ["username": self.usernamePassed]
//            let childUpdates = ["/posts/\(key)": post,
//                    "/user-posts/\(String(describing: user?.uid))!/\(key)/": post]
//            self.ref.updateChildValues(childUpdates)
        let cardParams = self.paymentTextField.cardParams
        
        STPAPIClient.shared().createToken(withCard: cardParams) { token, error in
            guard let stripeToken = token else {
                NSLog("Error creating token: %@", error!.localizedDescription);
                return
            }
            
            // TODO: send the token to your server so it can create a charge
            let alert = UIAlertController(title: "Welcome to Stripe", message: "Token created: \(stripeToken)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
            
            
            
            self.ref.child("Users").child((user?.uid)!).child("Email").setValue(self.emailPassed)
            self.ref.child("Users").child((user?.uid)!).child("Stripe Id").setValue("None")
           self.ref.child("Users").child((user?.uid)!).child("Bus Ticket").setValue("None")
            self.ref.child("Users").child((user?.uid)!).child("History").setValue("None")
            self.ref.child("Users").child((user?.uid)!).child("Username").setValue(self.usernamePassed)
            self.ref.child("Users").child((user?.uid)!).child("Card Info").child("Stripe Token").setValue("\(stripeToken)")
        }
            
    
            
//            self.ref.child("Users").child((user?.uid)!).child("Card Info").child("Zip Code").setValue(self.ZipCode.text!)
//
//                self.ref.child("Users").child((user?.uid)!).child("Card Info").child("Billing Adress").child("Street Name").setValue(self.StreetName.text!)
//
//            self.ref.child("Users").child((user?.uid)!).child("Card Info").child("Billing Adress").child("City").setValue(self.City.text!)
//
//            self.ref.child("Users").child((user?.uid)!).child("Card Info").child("Billing Adress").child("State").setValue(self.State.text!)
//
//            self.ref.child("Users").child((user?.uid)!).child("Card Info").child("Billing Adress").child("Zip Code").setValue(self.ZipCode.text!)
            
            
            
            self.shouldPerformSegue(withIdentifier: "Registration_to_Sign_In", sender: self)
            print("\(user!.email!) created")
            
            
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //code needs to change below
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/80, y: self.view.frame.size.height-100, width: self.view.frame.size.width - 10, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Nunito", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}

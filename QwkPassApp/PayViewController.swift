//
//  PayViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 11/13/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import Stripe
import Firebase


class PayViewController: UIViewController, STPPaymentCardTextFieldDelegate {

   // @IBOutlet weak var paymentTextField: STPPaymentCardTextField!
    
    @IBOutlet weak var paymentTextField: STPPaymentCardTextField!
    @IBOutlet weak var submitButton: UIButton!

    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentTextField.delegate = self
        
        self.submitButton.isEnabled = false
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

    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        submitButton.isEnabled = textField.isValid
    }
    
    @IBAction func submitCard(_ sender: Any) {
        ref = Database.database().reference()
        // If you have your own form for getting credit card information, you can construct
        // your own STPCardParams from number, month, year, and CVV.
        let cardParams = paymentTextField.cardParams
        
        STPAPIClient.shared().createToken(withCard: cardParams) { token, error in
            guard let stripeToken = token else {
                NSLog("Error creating token: %@", error!.localizedDescription);
                return
            }
            
            // TODO: send the token to your server so it can create a charge
            let alert = UIAlertController(title: "Welcome to Stripe", message: "Token created: \(stripeToken)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
//    @IBAction func submitCard(_ sender: AnyObject?) {
//
//    }

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

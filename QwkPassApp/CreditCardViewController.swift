//
//  CreditCardViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 11/13/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import Stripe
import SVProgressHUD

class CreditCardViewController: UIViewController, STPPaymentCardTextFieldDelegate, CardIOPaymentViewControllerDelegate{

    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var paymentTextField: STPPaymentCardTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

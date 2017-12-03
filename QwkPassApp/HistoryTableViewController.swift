//
//  HistoryTableViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 12/2/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import Firebase

class HistoryTableViewController: UITableViewController{



    @IBOutlet weak var NavHistory: UINavigationItem!
    var ref: DatabaseReference!
    var myOtherEmptyArray = [String]()
    
    @IBAction func Dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //var count = 4
    
    @IBOutlet weak var Dismiss: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.barStyle       = UIBarStyle.black // I then set the color using:
        
//        self.navigationController?.navigationBar.barTintColor   = UIColor(red:52/255, green:120/255, blue:250/255, alpha:1.0) // a lovely red
        
        self.navigationController?.navigationBar.tintColor = UIColor.white // for titles, buttons, etc.
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
        
        
//        NavHistory.barTintColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)// Set any colour
//        NavHistory.isTranslucent = false
//
//        NavHistory.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:UIFont(name:"Nunito-Bold", size: 17)!]
        
//        let barView = UIView(frame: CGRect(x:0, y:0, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
//        barView.backgroundColor = UIColor(red:52/255, green:120/255, blue:246/255, alpha:1.0)
//        view.addSubview(barView)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        ref = Database.database().reference()
//
//        var count = 0
//        let userID = Auth.auth().currentUser?.uid
//        ref.child("Users").child(userID!).child("History").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            if !snapshot.exists() { return }
//
//            let value = snapshot.value as? NSDictionary
//
//            count = (value?.count)!
//
//            print(count)
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
        print(self.myOtherEmptyArray.count)
        
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            
        }
        
        let user = Auth.auth().currentUser
        if let user = user {
            
        }
        
        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("Users").child(userID!).child("History").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if !snapshot.exists() { return }
            
            print(snapshot)
            let value = snapshot.value as? NSDictionary
            let history = value?["History"] as? String ?? ""
            
            //self.myOtherEmptyArray.append("username")
            
            if(history == "None"){
                cell.textLabel?.text = "No History"
                return
            }
            else{
            for (key, value) in value! {
                print(value)
                self.myOtherEmptyArray.append(value as! String)
                
            }
            }
            
            print(self.myOtherEmptyArray)
            
            print(self.myOtherEmptyArray.count)
          
            //cell.textLabel?.text = arrayOfStrings[indexPath.row]
            cell.textLabel?.text = self.myOtherEmptyArray[indexPath.row]
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        //cell.textLabel?.text = "Test"
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

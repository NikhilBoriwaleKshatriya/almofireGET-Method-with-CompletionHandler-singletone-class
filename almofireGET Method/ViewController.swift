//
//  ViewController.swift
//  almofireGET Method
//
//  Created by Nikhil Boriwale on 19/12/17.
//  Copyright © 2017 nikhilboriwale. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var myTable: UITableView!
    // declare this myResponse keyword to store Success data get
    var  myResponse : JSON = nil
    // handling Multiple user data then store in array
    var users : [user] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        
    }
    
    func fetchUser()
    {
   
        // BY  USing this line we create completion handler 
      // {(isFetched) -> Void in
        //}
        
        //Accessing any function with singletone class using this line
        APIManager.sharedInstance.getUsersFromUrl(){(userJson) -> Void in
           if userJson != nil
           {
            self.myResponse = userJson
                                // get particular elimate value from server use for loop
                                for i in 0..<self.myResponse.count{
            
                                    let singleuser = user(userJson:self.myResponse[i])
                                    //append all user data in "users" array
                                    self.users.append(singleuser)
            
                                }
            DispatchQueue.main.async {
                  self.myTable.reloadData()
            }
                
            
            
            
        }
    }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:usercell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as! usercell
        let myUser = self.users[indexPath.row]
        cell.name.text = myUser.name
        cell.username.text = myUser.username
        cell.email.text = myUser.emial
        cell.phone.text = myUser.phone
        print(myUser.phone)
        cell.companyname.text = myUser.mycompany.companyname
         print(myUser.mycompany.companyname)
        cell.pharse.text = myUser.mycompany.phrase
             print(myUser.mycompany.phrase)
        cell.address.text = myUser.myaddress.street
        print(myUser.myaddress.street)
        
    
        return cell
    }

}



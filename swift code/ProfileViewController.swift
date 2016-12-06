//
//  ProfileViewController.swift
//  Nu
//
//  Created by Mark Murtagh on 07/03/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var user = User()
 
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postB: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text=user.name
        
        //profilePic.image = user.profilePic
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postA(_ sender: AnyObject) {
        performSegue(withIdentifier: "toPost", sender: self.user)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="toPost")
        {
            let newPVC:newPostPageViewController=segue.destination as! newPostPageViewController
            let data = user as User
            newPVC.user=data
           
            
            
        }
        
    }

    
    
    
}

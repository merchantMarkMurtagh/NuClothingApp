//
//  SecondViewController.swift
//  Nu
//
//  Created by Mark Murtagh on 13/02/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewControllerInstance: FirstViewController = FirstViewController()
        self.tabBarController?.tabBar.isHidden = false
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.black.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
        
        
        userName.setTitle(viewControllerInstance.userName, for: UIControlState())
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


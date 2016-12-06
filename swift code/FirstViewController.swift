//
//  FirstViewController.swift
//  Nu
//
//  Created by Mark Murtagh on 13/02/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit
import FBSDKCoreKit



class FirstViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    var userName = "USERNAME"
    var email = ""
    let loginView : FBSDKLoginButton = FBSDKLoginButton()
    var imageProfile : UIImage!
    
    @IBOutlet weak var realContinue: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realContinue.isHidden=true
        //self.tabBarController?.tabBar.hidden = true
        
        if (FBSDKAccessToken.current() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            
            self.view.addSubview(loginView)
            loginView.frame=CGRect(x: 0,y: 0,width: 210,height: 50);
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
            
        }
        
    }

    
//    func createHTTPRequest(requestURL : String, requestMethod : String, requestBody : NSData) -> NSMutableURLRequest {
//        // TODO: fill in
//        let username = ""
//        // TODO: fill in
//        let password = ""
//        
//        let loginString = NSString(format: "%@:%@", username, password)
//        let loginData : NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
//        let base64LoginString = loginData.base64EncodedStringWithOptions([])
//        
//        // create the request
//        let url = NSURL(string: requestURL)
//        let request = NSMutableURLRequest(URL: url!)
//        
//        // POST, GET or DELETE
//        request.HTTPMethod = requestMethod
//        
//        // TODO: Refactor below
//        // If a POST, JSON body will be included, otherwise ""
//        request.HTTPBody = requestBody
//        
//        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//        
//        return request
//    }
//    
//    // Function taking a User, and will upload said user to the database system
//    func postUserData(user: User){
//        // setup variables
//        let POST = "POST"
//        
//        // get JSON version of user
//        let jsonUserData = user.toJSON()
//        // use createHTTPRequest method to make a request
//        let request = createHTTPRequest("todo", requestMethod: POST, requestBody: jsonUserData!)
//        // send the request
//        let urlConnection = NSURLConnection(request: request, delegate: self)
//    }
    
    // TODO: Finish this function, low priority
    // Function taking a User ID, and returning the user
//    func getUserData(userID: Int) -> User{
        // get request to server with user id, return the user
        
        // User type requires initialisation
//        let user : User
//        return user
//    }
    
    
   
    // Facebook Delegate Methods
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        returnUserData()
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
        loginView.isHidden=true
        realContinue.isHidden=false
        
        
    }
    
    func returnUserData()  //REAL IMPORTANT
    {

        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name,email"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName1 : NSString = result.value(forKey: "name") as! NSString
                self.userName = userName1 as String
                print("User Name is: \(self.userName)")
                let userEmail : NSString = result.value(forKey: "email") as! NSString
                self.email = userEmail as String
                print("User Email is: \(userEmail)")
                
                let userID = result["id"] as! NSString
                let facebookProfileUrl = "https://graph.facebook.com/\(userID)/picture?type=large"
                let imgURL = URL(string: facebookProfileUrl)
                let imageData = try? Data(contentsOf: imgURL!)
                self.imageProfile = UIImage(data: imageData!)!
                
            }
           
            
        }
            
        )
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="transitionToSetup")
        {
            let setupVC:setupViewController=segue.destination as! setupViewController
            let data = user as User
            setupVC.user=data
            
        }
    }
    
    @IBAction func ContinueSetup(_ sender: AnyObject) {
        user=User()
        user.name = userName
        user.email = email
        //user.profilePic = imageProfile
        performSegue(withIdentifier: "transitionToSetup", sender: self.user)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


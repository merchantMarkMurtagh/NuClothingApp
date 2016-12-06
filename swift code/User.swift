//
//  User.swift
//  Nu
//
//  Created by Mark Murtagh on 03/03/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit
import Foundation

class User: NSObject{
   
    // MARK: Properties
    
    var name: String = ""
    var email: String = ""
    var profilePic: UIImage!
    var size = 0
    
    // MARK: Initialisation
    
    // PATRICK: Test toJSON method
    func toJSON() -> Data? {
        let json = [ "name": name ,
                     "email": email,
                     "profilePic": profilePic,
                     "size": size
        ] as [String : Any]
        do{
            return try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        }catch{
            print("error serializing JSON: \(error)")
            // if nil is returned, an error has occured with serializing the JSON
            return nil
        }

    }
}

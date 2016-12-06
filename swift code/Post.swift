//
//  Post.swift
//  Nu
//
//  Created by Mark Murtagh on 13/03/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit
import Foundation



class Post: NSObject{
    
    
    
    var user : User?
    var name : String?
    var size : String?
    var clothesName : String?
    var postPhoto : UIImage?
    var tag1: String?
    var tag2: String?
    var tag3: String?
    
    init(name: String, photo:UIImage, size: String, tag1t: String, tag2t: String, tag3t: String)
    {
        self.name = name
        self.postPhoto = photo
        self.tag1 = tag1t
        self.tag2 = tag2t
        self.tag3 = tag3t
    }
   
    
    
}
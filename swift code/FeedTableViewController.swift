//
//  FeedTableViewController.swift
//  Nu
//
//  Created by Patrick O'Boyle on 02/04/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    // MARK: - UITableViewDataSource
    var userImage = UIImage(named: "profilePicture")
    let postImage = UIImage(named: "profilePicture")
    
//     var dataArray = [
//        ["Ali", userImage, "", "Size: 7", "Description: Red dresssomething something clothes?"]
//        ]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        
//        cell.textLabel!.text = dataArray[indexPath.item]
//        cell.imageView?.image = dataArray[indexPath][1].item
//        cell.imageView?.image = dataArray[indexPath][2].item
//        cell.textLabel?.text = dataArray[indexPath][3].item
//        cell.textLabel?.text = dataArray[indexPath][4].item
        return cell
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}

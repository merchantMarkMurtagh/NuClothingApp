//
//  postsTableViewController.swift
//  Nu
//
//  Created by Mark Murtagh on 25/03/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit

class postsTableViewController: UITableViewController {
    
    var posts = [Post]()
    
    var samplePosts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleData()
        
               // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func loadSampleData()
    {
    
        let photo1 = UIImage(named: "sample1")
        let post1 = Post(name: "Jumper", photo: photo1!, size: "10", tag1t: "#orange", tag2t: "#pattern" , tag3t: "#tightFit")
        let photo2 = UIImage(named: "sample2")
        let post2 = Post(name: "Jeans", photo: photo2!, size: "32R", tag1t: "#Jeans", tag2t: "wornWash", tag3t: "#Fade" )
        let photo3 = UIImage(named: "sample3")
        let post3 = Post(name: "Dress", photo: photo3!, size: "14", tag1t: "#summerDress", tag2t: "#pokaDots", tag3t: "#reds" )
        
        samplePosts += [post1, post2, post3]
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PostsTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PostsTableViewCell
        
        let sPost = samplePosts[indexPath.row]
        
        cell.postImage.image = sPost.postPhoto
        cell.tagField.text = sPost.tag1! + " " + sPost.tag2! + " " + sPost.tag3!
        cell.postTitle.text = sPost.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}

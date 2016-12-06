//
//  newPostPageViewController.swift
//  Nu
//
//  Created by Mark Murtagh on 12/03/2016.
//  Copyright © 2016 programmingProject. All rights reserved.
//

import UIKit

class newPostPageViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    
//    var newPost = Post(name: "", photo: , size: nil, tag1t: nil, tag2t: nil, tag3t: nil )
    var newPost : Post!
    var user = User()
    
    //post Information
    @IBOutlet weak var sizeField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var tag1: UITextField!
    @IBOutlet weak var tag2: UITextField!
    @IBOutlet weak var tag3: UITextField!
    @IBOutlet weak var postPhoto: UIImageView!
    
    //elements
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sizeField.delegate = self
        nameField.delegate = self
        tag1.delegate = self
        tag2.delegate = self
        tag3.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Hide the keyboard.
        
        textField.resignFirstResponder()
        return true
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : Any])
    {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        var selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        selectedImage = resizeImage(selectedImage, newWidth: 200)
        // Set photoImageView to display the selected image.
        imagePost.image = selectedImage
    
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    
    }
    
    func resizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func retrievePostInfo()
    {
        self.newPost.size = sizeField.text
        print(self.newPost.size)
        self.newPost.name = nameField.text
        self.newPost.tag1 = tag1.text
       
        self.newPost.tag2 = tag2.text
        self.newPost.tag3 = tag3.text
        self.newPost.postPhoto = postPhoto.image
        print(self.newPost.tag1)
        
    }
    
    
    @IBAction func postFinished(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "postDone", sender: self.user)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="postDone")
        {
            retrievePostInfo()
            let newProfile:ProfileViewController=segue.destination as! ProfileViewController
                let data = newPost as Post
            
        }
        if(segue.identifier=="test1")
        {
            retrievePostInfo()
            let newList:postsTableViewController=segue.destination as! postsTableViewController
            let data = newPost as Post
            //newList.testPost=data
            
        }

    }

    @IBAction func testList(_ sender: UIButton) {
        performSegue(withIdentifier: "test1", sender: self.newPost)

    }
    
}

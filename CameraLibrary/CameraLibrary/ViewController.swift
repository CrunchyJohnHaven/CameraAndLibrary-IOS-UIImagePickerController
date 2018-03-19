//
//  ViewController.swift
//  CameraLibrary
//
//  Created by john bradley on 3/18/18.
//  Copyright © 2018 john. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        var imagePicked: UIImage?
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func openCamerButton(_ sender: Any) {
        //check ig the camera is available on the device
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            declare a variable of image picker controller
            var imagePicker = UIImagePickerController()
//            set its delegate
            imagePicker.delegate = self
//            set its source type
            imagePicker.sourceType = .camera;
//            tell camera not to go into edit mode
            imagePicker.allowsEditing = false
//            present the camera controller on the bottom of the screen
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func openPhotoLibraryButton(_ sender: Any) {
        print("openPhotoLibraryButton")
//        check if device can access photo library
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            print("isAvailable")
//            //declase another image picker's variable
            var imagePicker = UIImagePickerController()
//            //Set a delegate for imagePicker
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
//            // we will see a black window where we can zoom move and crop
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
//    add a delegate to our class
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        set its object as the chosen image from library or camera
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        dismiss the controller and get back to our main screen
        self.imagePicked.image = image
        print("imagePicked.image: ", self.imagePicked.image)
        print("image: ", image)
        dismiss(animated:true, completion: nil)
    }
    @IBAction func saveButt(_ sender: Any) {
        print("Save")
////        declare a variable of NSData for our image and compress it to 0.6 quality (0.0 to 1.0)
        let imageData = UIImageJPEGRepresentation(self.imagePicked.image!,  0.6)
////        create a new UIImage and pass it the data previously made into it
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        let alertController = UIAlertController(title: "Wow", message: "our image has been saved to Photo Library!", preferredStyle: UIAlertControllerStyle.alert)
    }
    
    

}


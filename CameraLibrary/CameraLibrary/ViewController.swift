//
//  ViewController.swift
//  CameraLibrary
//
//  Created by john bradley on 3/18/18.
//  Copyright © 2018 john. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePicked: UIImageView!
    
    override func viewDidLoad() {
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
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func openPhotoLibraryButton(_ sender: Any) {
        
    }
    

}


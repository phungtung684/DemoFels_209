//
//  UpdateProfileViewController.swift
//  E-LearningSystem
//
//  Created by Nguyễn Tiến Mạnh on 11/8/16.
//  Copyright © 2016 Ngo Sy Truong. All rights reserved.
//

import UIKit

class UpdateProfileViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var oldPasswordTextfield: UITextField!
    @IBOutlet weak var newPasswordTextfield: UITextField!
    @IBOutlet weak var retypePasswordTextfield: UITextField!
    @IBOutlet weak var fullnameTextfield: UITextField!
    @IBOutlet weak var avataImageView: UIImageView!
    @IBOutlet weak var chooseImageButton: UIButton!
    
    var email: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        addIconToTextFields()
        self.title = "Update Profile"
        emailTextfield?.text = email
        emailTextfield.userInteractionEnabled = false
        chooseImageButton?.layer.cornerRadius = 10
        chooseImageButton?.layer.borderWidth = 3
        chooseImageButton?.layer.borderColor = UIColor.grayColor().CGColor
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: #selector(UpdateProfileViewController.updateAction))
        navigationItem.rightBarButtonItem = button
    }
    
    @IBAction func chooseImage(sender: AnyObject) {
    }
    
    func updateAction() {
        print("saved")
    }
    
    // MARK: - Add icons to the Textfields
    private func addIconToTextFields() {
        let imageViewEmail = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageViewEmail.contentMode = UIViewContentMode.Center
        let imageEmail  = UIImage(named: "email_icon")
        imageViewEmail.image = imageEmail
        emailTextfield?.leftView = imageViewEmail
        emailTextfield?.leftViewMode = UITextFieldViewMode.Always
        
        let imageViewOldPassword = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageViewOldPassword.contentMode = UIViewContentMode.Center
        let imageOldPassword  = UIImage(named: "password_icon")
        imageViewOldPassword.image = imageOldPassword
        oldPasswordTextfield?.leftView = imageViewOldPassword
        oldPasswordTextfield?.leftViewMode = UITextFieldViewMode.Always
        
        let imageViewNewPassword = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageViewNewPassword.contentMode = UIViewContentMode.Center
        let imageNewPassword  = UIImage(named: "password_icon")
        imageViewNewPassword.image = imageNewPassword
        newPasswordTextfield?.leftView = imageViewNewPassword
        newPasswordTextfield?.leftViewMode = UITextFieldViewMode.Always
        
        let imageViewRetypePass = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageViewRetypePass.contentMode = UIViewContentMode.Center
        let imageConfirmPass  = UIImage(named: "password_icon")
        imageViewRetypePass.image = imageConfirmPass
        retypePasswordTextfield?.leftView = imageViewRetypePass
        retypePasswordTextfield?.leftViewMode = UITextFieldViewMode.Always
        
        let imageViewFullname = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageViewFullname.contentMode = UIViewContentMode.Center
        let imageFullname  = UIImage(named: "fullname_icon")
        imageViewFullname.image = imageFullname
        fullnameTextfield?.leftView = imageViewFullname
        fullnameTextfield?.leftViewMode = UITextFieldViewMode.Always
    }
}

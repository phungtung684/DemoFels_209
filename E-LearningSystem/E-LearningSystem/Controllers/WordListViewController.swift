//
//  WordListViewController.swift
//  E-LearningSystem
//
//  Created by Phùng Tùng on 11/9/16.
//  Copyright © 2016 Ngo Sy Truong. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class WordListViewController: UIViewController, FBSDKLoginButtonDelegate {
    var wordlistService = WordListService()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let customLoginButton = UIButton(type: .System)
        customLoginButton.backgroundColor = UIColor.blueColor()
        customLoginButton.frame = CGRect(x: 16, y: 70, width: view.frame.width - 32, height: 50)
        customLoginButton.setTitle("Custom FB Login here", forState: UIControlState.Normal)
        customLoginButton.titleLabel?.font = UIFont.boldSystemFontOfSize(16)
        customLoginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        customLoginButton.addTarget(self, action: #selector(handleCustomFBLogin), forControlEvents: .TouchUpInside)
        
        view.addSubview(customLoginButton)
//        let loginButton = FBSDKLoginButton()
//        view.addSubview(loginButton)
//        loginButton.frame = CGRect(x: 16, y: 70, width: view.frame.width - 32, height: 50)
//        loginButton.delegate = self
//        loginButton.readPermissions = ["email", "public_profile"]
//        wordlistService.getWordList("", token: "", success: { (wordList) in
//            print(wordList)
//            }) { (message) in
//                print(message)
//        }
        
        // Do any additional setup after loading the view.
    }
    func handleCustomFBLogin() {
        FBSDKLoginManager().logInWithReadPermissions(["email", "public_profile"], fromViewController: self) { (result, error) in
            print(result?.token.tokenString ?? "cancel")
        }
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).startWithCompletionHandler { (connection, result, error) in
            let id = result["id"] as? String ?? ""
            let name = result["name"] as? String ?? ""
            let email = result["email"] as? String ?? ""
            print(id)
            print(name)
            print(email)
        }
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error != nil {
            print(error)
            return
        }
        
        print("Successfully logged in with facebook...")
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email, public_profile"]).startWithCompletionHandler { (connection, result, error) in
            print(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        tableView.contentInset.top = 0

    }

}
extension WordListViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
            return cell
    }
    
}
extension WordListViewController: UITableViewDelegate {
    
}

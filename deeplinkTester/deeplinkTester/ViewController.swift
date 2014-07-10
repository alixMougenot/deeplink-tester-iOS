//
//  ViewController.swift
//  deeplinkTester
//
//  Created by Alix Mougenot on 09/07/14.
//  Copyright (c) 2014 Criteo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var deeplinkInfoLabel: UILabel
    @IBOutlet var errorLabel: UILabel
    @IBOutlet var deeplinkLabel: UILabel
    @IBOutlet var userInput: UITextField
    @IBOutlet var thumbUpLabel: UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mydelegate = UIApplication.sharedApplication().delegate as AppDelegate
        mydelegate.controller = self
        userInput.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        let mydelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        if let deeplinktext =  mydelegate.currentDeeplink {
            if let deeplinksource = mydelegate.fromApp {
                deeplinkInfoLabel.text = deeplinksource
                deeplinkLabel.text = deeplinktext
            }
        } else {
            deeplinkInfoLabel.text = "User Launch"
            deeplinkLabel.text = "N/A"
        }
    }
    
    //MARK: - Text Feild Delegate
    func textFieldDidBeginEditing(textField: UITextField!){
        textField.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        go()
        return true
    }
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool{
        dispatch_async(dispatch_get_main_queue(), {self.checkInput()})
        return true
    }
    
    //MARK: - Actions
    @IBAction func go(){
        checkInput()
        let deeplinkuserinput: String = userInput.text
        if let url = NSURL.URLWithString(deeplinkuserinput) {
            let app = UIApplication.sharedApplication()
            if app.canOpenURL(url){
                app.openURL(url);
            }else {
                errorLabel.text = "No App found"
                animateErrorLabel()
            }
        } else{
            errorLabel.text = "This is not a valid URL"
            animateErrorLabel()
        }
    }
    
    func checkInput(){
        let deeplinkuserinput: String = userInput.text
        if let url = NSURL.URLWithString(deeplinkuserinput) {
            let app = UIApplication.sharedApplication()
            if app.canOpenURL(url){
                thumbUpLabel.alpha = 1
                return
            }
        }
        thumbUpLabel.alpha = 0
    }
    
    func animateErrorLabel() {
        if let label = errorLabel {
            UIView.animateWithDuration(1.0, animations: {
                label.alpha = 1.0
                } , completion:{ _ in
                    UIView.animateWithDuration(1.0, delay: 1.5, options: UIViewAnimationOptions() , animations:{
                        label.alpha = 0.0
                        }, completion: nil)
                }
            )
        }
        
    }
    
    
}


//
//  LoginViewController.swift
//  Lecture15Demo_10_1
//
//  Created by Cathal F. Hoare on 06/11/2019.
//  Copyright © 2019 Cathal F. Hoare. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var errorCode:Int = -1;
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "doingLoginSegue"{
            errorLabel.text = ""
            errorLabel.isHidden = true
            delegate.user.signin(with: username.text!, password: password.text!)
        }
        else if segue.identifier == "startRegistrationSegue" {
            errorLabel.text = ""
            errorLabel.isHidden = true
        }
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        print("***** RUNNING UNWIND SEGUE FUNCTION IN LOGIN VIEW CONTROLLER ********")
        let origin = segue.source as! WaitViewController
        errorCode = origin.errorCode!
        
        if(errorCode != -1){
            let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource:"errors", ofType:"plist")!)
            let errorDictionary = dictionary?["errors"] as! Dictionary<String, Any>
            let errorText = errorDictionary[String(errorCode)]
            
            errorLabel.text = errorText as? String
            errorLabel.isHidden = false
        }
    }

}

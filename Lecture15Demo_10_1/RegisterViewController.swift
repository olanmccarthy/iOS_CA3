//
//  RegisterViewController.swift
//  Lecture15Demo_10_1
//
//  Created by Cathal F. Hoare on 06/11/2019.
//  Copyright © 2019 Cathal F. Hoare. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var errorCode:Int = -1;
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "doingRegistrationSegue"{
            errorLabel.text = ""
            errorLabel.isHidden = true
            delegate.user.register(with: usernameField.text!, password: passwordField.text!, confirmPassword: confirmPasswordField.text!)
        }
        else{
            
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

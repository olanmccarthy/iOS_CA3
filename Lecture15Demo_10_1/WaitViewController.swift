//
//  WaitViewController.swift
//  Lecture15Demo_10_1
//
//  Created by Cathal F. Hoare on 06/11/2019.
//  Copyright © 2019 Cathal F. Hoare. All rights reserved.
//

import UIKit

class WaitViewController: UIViewController {

    var errorCode:Int? = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess(_:)), name: Notification.Name("FirebaseDemo.signedin"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginFailure(_:)), name: Notification.Name("FirebaseDemo.failedsignin"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(registerSuccess(_:)), name: Notification.Name("FirebaseDemo.registered"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(registerFailure(_:)), name: Notification.Name("FirebaseDemo.failedregistration"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(registerFailurePasswords(_:)), name: Notification.Name("passwordfailedregistration"), object: nil)
        
        
    }
    
    @objc func loginSuccess(_ notification:Notification){
        performSegue(withIdentifier: "movetofirstpage", sender: self)
    }
    
    @objc func loginFailure(_ notification:Notification){
        errorCode = notification.userInfo!["error"] as? Int
        performSegue(withIdentifier: "movetologinpage", sender: self)
    }
    
    @objc func registerSuccess(_ notification:Notification){
        errorCode = -1
        performSegue(withIdentifier: "movetologinpage", sender: self)
    }
    
    @objc func registerFailure(_ notification:Notification){
        print("****** RUNNING REGISTRATION FAILURE FUNCTION *******")
        errorCode = notification.userInfo!["error"] as? Int
        print("***** WAIT VIEW CONTROLLER HAS RECEIVED ERROR MESSAGE, PERFORMING SEGUE *****")
        performSegue(withIdentifier: "movetologinpage", sender: self)
    }
    
    @objc func registerFailurePasswords(_ notification:Notification){
        print("****** RUNNING REGISTRATION FAILURE FUNCTION *******")
        errorCode = notification.userInfo!["error"] as? Int
        print("***** WAIT VIEW CONTROLLER HAS RECEIVED ERROR MESSAGE, PERFORMING SEGUE *****")
        performSegue(withIdentifier: "movetologinpage", sender: self)
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

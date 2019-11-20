//
//  AppDelegate.swift
//  Lecture15Demo_10_1
//
//  Created by Cathal F. Hoare on 06/11/2019.
//  Copyright © 2019 Cathal F. Hoare. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth

class User{
    
    func signin(with username:String, password:String){
        
        Auth.auth().signIn(withEmail: username, password:password){
            [weak self] authResult, error in
            
            if(authResult != nil){
                
                NotificationCenter.default.post(name:Notification.Name("FirebaseDemo.signedin"), object:nil, userInfo:nil)
            }
            else{
                
                let errCode = ["error":error!._code]
                
                NotificationCenter.default.post(name:Notification.Name("FirebaseDemo.failedsignin"), object:nil, userInfo:errCode)
            }
        }
    }
    
    func register(with username:String, password:String, confirmPassword:String){
        if (password == confirmPassword){
            Auth.auth().createUser(withEmail: username, password: password){
                [weak self] authResult, error in
                
                if(authResult != nil){
                    NotificationCenter.default.post(name:Notification.Name("FirebaseDemo.registered"), object:nil, userInfo:nil)
                }
                
                else { //both passwords matched but another error occured
                    let errCode = ["error":error!._code]
                    
                    NotificationCenter.default.post(name: Notification.Name("FirebaseDemo.failedregistration"), object: nil, userInfo: errCode)
                    
                }
            }
        }
        else { //paswords don't match
            print("****** PASSWORDS DO NOT MATCH ******")
            let errCode = ["error": "99999"]
            
            NotificationCenter.default.post(name: Notification.Name("passwordfailedregistration"), object: nil, userInfo: errCode)
            print("******* NOTIFICATION SENT *******")
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var user:User = User()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


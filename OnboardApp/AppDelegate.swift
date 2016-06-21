//
//  AppDelegate.swift
//  OnboardApp
//
//  Created by Alan Westbrook on 4/1/16.
//  Copyright © 2016 rockwood. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let mainWindow = UIWindow(frame: UIScreen.main().bounds)
        mainWindow.backgroundColor = UIColor.white()
        mainWindow.rootViewController = ViewController()
        mainWindow.makeKeyAndVisible()
        
        window = mainWindow
        return true
    }

}


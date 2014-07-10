//
//  AppDelegate.swift
//  deeplinkTester
//
//  Created by Alix Mougenot on 09/07/14.
//  Copyright (c) 2014 Criteo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var currentDeeplink: String?
    var fromApp: String?
    weak var controller: ViewController?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        currentDeeplink = nil
        fromApp = nil
        return true
    }
    
    func application(application: UIApplication!, openURL url: NSURL!, sourceApplication: String!, annotation: AnyObject!) -> Bool {
        if url {
            currentDeeplink = url.description
            fromApp = sourceApplication ? sourceApplication : "Unknown App"
            controller?.viewWillAppear(false)
        }
        return true
    }
    
    
    func application(application: UIApplication!, handleOpenURL url: NSURL!) -> Bool  {
        if url {
            currentDeeplink = url.description
            fromApp = "Unknown App"
            controller?.viewWillAppear(false)
        }
        return true
    }

    
}


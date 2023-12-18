//
//  AppDelegate.swift
//  OKXUIlib
//
//  Created by 1630880 on 12/18/2023.
//  Copyright (c) 2023 1630880. All rights reserved.
//

import UIKit
import OKXUIlib

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
            
        let viewController = OKXUIlib.HomeViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            viewController.showData(rawData: [
                ("https://wpclipart.com/education/animal_numbers/animal_number_1.jpg", "https://media.giphy.com/media/l0ExncehJzexFpRHq/giphy.mp4"),
                ("https://wpclipart.com/education/animal_numbers/animal_number_2.jpg", "https://media.giphy.com/media/26gsqQxPQXHBiBEUU/giphy.mp4"),
                ("https://wpclipart.com/education/animal_numbers/animal_number_3.jpg", "https://media.giphy.com/media/oqLgjAahmDPvG/giphy.mp4"),
                ("https://wpclipart.com/education/animal_numbers/animal_number_4.jpg", "https://media.giphy.com/media/d1E1szXDsHUs3WvK/giphy.mp4"),
                ("https://wpclipart.com/education/animal_numbers/animal_number_5.jpg", "https://media.giphy.com/media/OiJjUsdAb11aE/giphy.mp4"),
                ("https://wpclipart.com/education/animal_numbers/animal_number_6.jpg", "https://media.giphy.com/media/4My4Bdf4cakLu/giphy.mp4")
            ])
        }
        
        window?.rootViewController = viewController
            
        window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


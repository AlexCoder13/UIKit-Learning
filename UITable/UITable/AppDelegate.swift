//
//  AppDelegate.swift
//  UITable
//
//  Created by Александр Семёнов on 05.02.2025.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
    func applicationDidBecomeActive(_: UIApplication) {
    }
    
    func applicationWillResignActive(_: UIApplication) {
    }
    
    func applicationDidEnterBackground(_: UIApplication) {
    }
    
    func applicationWillEnterForeground(_: UIApplication) {
    }
    
    func applicationWillTerminate(_: UIApplication) {

    }
    
    
}


//
//  AppDelegate.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable line_length trailing_whitespace

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    var coreDataStack = DBService()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
                
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator.createFlow()
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}

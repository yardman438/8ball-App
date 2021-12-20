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
    var coreDataStack = DBService()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
                
        let userDefaultsManager = UserDefaultsManager(defaults: UserDefaults.standard)
        let networkManager = RandomAnswerManager()
                
        window?.rootViewController = AppCoordinator(dbService: coreDataStack, networkManager: networkManager, userDefaults: userDefaultsManager).createFlow()
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}

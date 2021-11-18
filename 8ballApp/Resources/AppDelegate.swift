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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let networkManager = RandomAnswerManager()
        let ballModel = BallModel(randomAnswerManager: networkManager)
        let ballViewModel = BallViewModel(ballModel: ballModel)
        let rootViewController = BallViewController(viewModel: ballViewModel)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}

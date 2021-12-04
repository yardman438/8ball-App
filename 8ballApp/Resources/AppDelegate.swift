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
        
        let ballModel = BallModel(networkManager: networkManager, dbService: coreDataStack)
        let ballViewModel = BallViewModel(model: ballModel)
        
        let settingsScrenModel = SettingsScreenModel(dbService: coreDataStack, userDefaults: userDefaultsManager)
        let settingsScreenViewModel = SettingsScreenViewModel(model: settingsScrenModel)
        
        let historyScreenModel = HistoryScreenModel(dbService: coreDataStack)
        let historyScreenViewModel = HistoryScreenViewModel(model: historyScreenModel)
        
        let tabBarViewModel = MainTabBarViewModel(ballViewModel: ballViewModel, settingsScreenViewModel: settingsScreenViewModel, historyScreenViewModel: historyScreenViewModel)
        let tabBarController = MainTabBarController(viewModel: tabBarViewModel)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}

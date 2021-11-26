//
//  AppDelegate.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable line_length trailing_whitespace

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coreDataStack = CoreDataStack()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let context = coreDataStack.persistentContainer.viewContext
        
        let userDefaultsManager = UserDefaultsManager()
        let customAnswerManager = CustomAnswerManager(context: context, defaultsManager: userDefaultsManager)
        let answerHistoryManager = AnswerHistoryManager(context: context)
        let networkManager = RandomAnswerManager()
        
        let ballModel = BallModel(networkManager: networkManager, localManager: answerHistoryManager)
        let ballViewModel = BallViewModel(model: ballModel)
        
        let settingsScrenModel = SettingsScreenModel(localManager: customAnswerManager)
        let settingsScreenViewModel = SettingsScreenViewModel(model: settingsScrenModel)
        
        let historyScreenModel = HistoryScreenModel(localManager: answerHistoryManager)
        let historyScreenViewModel = HistoryScreenViewModel(model: historyScreenModel)
        
        let tabBarViewModel = MainTabBarViewModel(ballViewModel: ballViewModel, settingsScreenViewModel: settingsScreenViewModel, historyScreenViewModel: historyScreenViewModel)
        let tabBarController = MainTabBarController(viewModel: tabBarViewModel)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}

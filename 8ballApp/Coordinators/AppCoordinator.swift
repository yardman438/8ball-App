//
//  AppCoordinator.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.12.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

final class AppCoordinator: NavigationNode, Coordinator {
    
    weak var containerViewController: UIViewController?
    
    private let window: UIWindow
    
    private let randomAnswerManager: RandomAnswerManager
    private let userDefaults: UserDefaultsManager
    private let dbService: DBService
    private let keychainManager: KeychainManager
    
    init(window: UIWindow) {
        
        self.window = window
        
        self.dbService = DBService()
        self.userDefaults = UserDefaultsManager(defaults: UserDefaults())
        self.randomAnswerManager = RandomAnswerManager()
        self.keychainManager = KeychainManager()
        
        super.init(parent: nil)
    }
    
    func createFlow() -> UIViewController {
        let ballVC = BallScreenCoordinator(parent: self,
                                           dbService: dbService,
                                           networkManager: randomAnswerManager,
                                           keychainManager: keychainManager).createFlow()
        let settingsVC = SettingsScreenCoordinator(parent: self,
                                                   dbService: dbService,
                                                   userDefaults: userDefaults).createFlow()
        let historyVC = HistoryScreenCoordinator(parent: self,
                                                 dbService: dbService).createFlow()
        
        let mainTabBarVC = UITabBarController()
        mainTabBarVC.setViewControllers([ballVC, settingsVC, historyVC], animated: true)
        mainTabBarVC.tabBar.barTintColor = UIColor(asset: Asset.backgroundColor)
        mainTabBarVC.tabBar.tintColor = UIColor(asset: Asset.secondaryColor)
        mainTabBarVC.tabBar.backgroundImage = UIImage()
        mainTabBarVC.tabBar.shadowImage = UIImage()
        
        window.rootViewController = mainTabBarVC
        window.makeKeyAndVisible()
        return window.rootViewController!
    }
}

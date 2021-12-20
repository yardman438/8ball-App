//
//  AppCoordinator.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.12.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

final class AppCoordinator: NavigationNode, Coordinator {
    
    var containerViewController: UIViewController?
    
    private let randomAnswerManager: RandomAnswerManager
    private let userDefaults: UserDefaultsManager
    private let dbService: DBService
    
    init(dbService: DBService, networkManager: RandomAnswerManager, userDefaults: UserDefaultsManager) {
        
        self.dbService = dbService
        self.userDefaults = userDefaults
        self.randomAnswerManager = networkManager
        
        super.init(parent: nil)
    }
    
    func createFlow() -> UIViewController {
        let ballVC = BallScreenCoordinator(parent: self,
                                           dbService: dbService,
                                           networkManager: randomAnswerManager).createFlow()
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
        
        return mainTabBarVC
    }
}

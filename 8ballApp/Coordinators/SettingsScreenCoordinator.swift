//
//  SettingsScreenCoordinator.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.12.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

final class SettingsScreenCoordinator: NavigationNode, Coordinator {
    
    var containerViewController: UIViewController?
    
    private let userDefaults: UserDefaultsManager
    private let dbService: DBService
    
    init(parent:NavigationNode, dbService: DBService, userDefaults: UserDefaultsManager) {
        self.dbService = dbService
        self.userDefaults = userDefaults
        super.init(parent: parent)
    }
    
    func createFlow() -> UIViewController {
        let settingsScreenModel = SettingsScreenModel(dbService: dbService, userDefaults: userDefaults)
        let settingsScreenViewModel = SettingsScreenViewModel(model: settingsScreenModel)
        let settingsScreenVC = SettingsScreenViewController(viewModel: settingsScreenViewModel)
        let navigationController = UINavigationController(rootViewController: settingsScreenVC)
        navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(asset: Asset.settings),
            selectedImage: nil)
        navigationController.title = L10n.settingsTitle
        return navigationController
    }
}

//
//  HistoryScreenCoordinator.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.12.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

final class HistoryScreenCoordinator: NavigationNode, Coordinator {
    
    var containerViewController: UIViewController?
    
    private let dbService: DBService

    init(parent: NavigationNode, dbService: DBService) {
        self.dbService = dbService
        super.init(parent: parent)
    }
    
    func createFlow() -> UIViewController {
        let historyModel = HistoryScreenModel(dbService: dbService)
        let historyViewModel = HistoryScreenViewModel(model: historyModel)
        let historyVC = HistoryScreenViewController(viewModel: historyViewModel)
        let navigationController = UINavigationController(rootViewController: historyVC)
        navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(asset: Asset.history),
            selectedImage: nil)
        navigationController.title = L10n.historyTitle
        return navigationController
    }
}

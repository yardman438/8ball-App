//
//  BallScreenCoordinator.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.12.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

final class BallScreenCoordinator: NavigationNode, Coordinator {
    
    weak var containerViewController: UIViewController?
    
    private let randomAnswerManager: RandomAnswerManager
    private let dbService: DBService
    private let keychainManager: KeychainManager
    
    init(parent: NavigationNode,
         dbService: DBService,
         networkManager: RandomAnswerManager,
         keychainManager: KeychainManager) {
        
        self.dbService = dbService
        self.randomAnswerManager = networkManager
        self.keychainManager = keychainManager
        super.init(parent: parent)
    }
    
    func createFlow() -> UIViewController {
        let ballModel = BallModel(networkManager: randomAnswerManager,
                                  dbService: dbService,
                                  keychainManager: keychainManager)
        let ballViewModel = BallViewModel(model: ballModel)
        let ballVC = BallViewController(viewModel: ballViewModel)
        self.containerViewController = ballVC
        let navigationController = UINavigationController(rootViewController: ballVC)
        navigationController.tabBarItem = UITabBarItem(
            title: L10n.title,
            image: UIImage(asset: Asset.ball),
            selectedImage: nil)
        let logo = UIImage(asset: Asset._8Ball)
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        navigationController.navigationItem.titleView = imageView
        return navigationController
    }
}

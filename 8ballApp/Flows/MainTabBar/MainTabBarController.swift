//
//  MainTabBarController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 24.11.2021.
//
// swiftlint:disable trailing_whitespace line_length

import UIKit

class MainTabBarController: UITabBarController {

    private var viewModel: MainTabBarViewModel
    
    init(viewModel: MainTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }

    func setupTabBar() {

        let firstVC = createNavController(viewController: BallViewController(viewModel: viewModel.ballViewModel),
                                          itemName: "Ball",
                                          itemImage: UIImage(asset: Asset.ball)!)
        let secondVC = createNavController(viewController: SettingsScreenViewController(viewModel: viewModel.settingsScreenViewModel),
                                           itemName: "Settings",
                                           itemImage: UIImage(asset: Asset.settings)!)
        let thirdVC = createNavController(viewController: HistoryScreenViewController(viewModel: viewModel.historyScreenViewModel),
                                           itemName: "History",
                                           itemImage: UIImage(asset: Asset.history)!)
        
        self.viewControllers = [firstVC, secondVC, thirdVC]
        tabBar.barTintColor = UIColor(asset: Asset.backgroundColor)
        tabBar.tintColor = UIColor(asset: Asset.secondaryColor)
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()

    }

    func createNavController(viewController: UIViewController,
                             itemName: String,
                             itemImage: UIImage) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: itemImage, tag: 0)
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        return navController
    }
}

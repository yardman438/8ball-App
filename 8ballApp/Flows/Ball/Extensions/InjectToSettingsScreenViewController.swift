//
//  File.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 17.11.2021.
//

import UIKit

extension BallViewController {
    func injectToSettingsScreenViewController() -> UIViewController {
        let destinationViewController = SettingsScreenViewController()
        let settingsScreenViewModel = SettingsScreenViewModel(model: SettingsScreenModel())
        destinationViewController.settingsScreenViewModel = settingsScreenViewModel
        return destinationViewController
    }
}

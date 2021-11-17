//
//  File.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 17.11.2021.
//

import UIKit

extension BallViewController {
    @IBSegueAction func injectToSettingsScreenViewController(_ coder: NSCoder) -> UIViewController {

        let destinationViewController = SettingsScreenViewController(coder: coder)!
        let settingsScreenViewModel = SettingsScreenViewModel(model: SettingsScreenModel())

        destinationViewController.settingsScreenViewModel = settingsScreenViewModel
        return destinationViewController
   }
}

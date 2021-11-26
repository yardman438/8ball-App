//
//  MainTabBarViewModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 24.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class MainTabBarViewModel {
    
    var ballViewModel: BallViewModel
    var settingsScreenViewModel: SettingsScreenViewModel
    var historyScreenViewModel: HistoryScreenViewModel
    
    init(ballViewModel: BallViewModel,
         settingsScreenViewModel: SettingsScreenViewModel,
         historyScreenViewModel: HistoryScreenViewModel) {
        self.ballViewModel = ballViewModel
        self.settingsScreenViewModel = settingsScreenViewModel
        self.historyScreenViewModel = historyScreenViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

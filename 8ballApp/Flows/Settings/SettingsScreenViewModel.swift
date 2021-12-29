//
//  SettingsScreenViewModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 14.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class SettingsScreenViewModel {
    
    private let settingsScreenModel: SettingsScreenModel
    var defaultAnswers: [String]
    
    init(model: SettingsScreenModel) {
        self.settingsScreenModel = model
        self.defaultAnswers = settingsScreenModel.loadDefaultAnswers()
    }
    
    func loadDefaultAnswers() -> [String] {
        return defaultAnswers
    }
    
    func saveAnswer(_ answer: String) {
        defaultAnswers.append(answer)
    }
}

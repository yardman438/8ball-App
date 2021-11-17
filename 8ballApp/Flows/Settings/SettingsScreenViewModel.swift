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
    
    init(model: SettingsScreenModel) {
        self.settingsScreenModel = model
    }

    func addNewAnswer(_ answer: String) {
        settingsScreenModel.addNewAnswer(answer)
    }
    
    func updateInterface() -> [String] {
        let customAnswers = settingsScreenModel.sendCustomAnswers()
        return customAnswers
    }
}

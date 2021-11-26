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
    
    func loadDefaultAnswers() -> [CustomAnswer?] {
        let customAnswers = settingsScreenModel.loadDefaultAnswers()
        return customAnswers
    }

    func addNewAnswer(_ answer: String) {
        settingsScreenModel.addNewAnswer(answer)
    }
    
    func deleteAnswer(_ selectedAnswer: CustomAnswer) {
        settingsScreenModel.deleteAnswer(selectedAnswer)
    }
    
    func updateInterface() -> [CustomAnswer?] {
        let customAnswers = settingsScreenModel.sendCustomAnswers()
        return customAnswers
    }
}

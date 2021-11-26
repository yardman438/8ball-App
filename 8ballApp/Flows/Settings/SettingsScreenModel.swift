//
//  CustomBallModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 14.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class SettingsScreenModel {
    
    private let customAnswerManager: CustomAnswerManager
    
    init(localManager: CustomAnswerManager) {
        self.customAnswerManager = localManager
    }
    
    func loadDefaultAnswers() -> [CustomAnswer?] {
        customAnswerManager.loadDefaultAnswers()
        return customAnswerManager.customAnswers
    }
    
    func sendCustomAnswers() -> [CustomAnswer?] {
        customAnswerManager.fetchAnswers()
        return customAnswerManager.customAnswers
    }
    
    func addNewAnswer(_ answer: String) {
        customAnswerManager.saveAnswer(withText: answer)
    }
    
    func deleteAnswer(_ selectedAnswer: CustomAnswer) {
        customAnswerManager.deleteAnswer(selectedAnswer)
    }
}

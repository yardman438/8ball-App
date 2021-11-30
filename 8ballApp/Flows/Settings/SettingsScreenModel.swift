//
//  CustomBallModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 14.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class SettingsScreenModel {
    
    private let dbService: DBService
    private let userDefaults: UserDefaultsManager
    
    init(dbService: DBService, userDefaults: UserDefaultsManager) {
        self.dbService = dbService
        self.userDefaults = userDefaults
    }
    
    func loadDefaultAnswers() -> [String] {
        return userDefaults.defaultAnswersArray
    }
    
    func saveAnswers(_ answer: Answer) {
        let managedAnswer = answer.toManaged(isLocal: true)
        dbService.saveAnswers(answers: [managedAnswer])
    }
}

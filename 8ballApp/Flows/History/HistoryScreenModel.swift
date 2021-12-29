//
//  HistoryScreenModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 24.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class HistoryScreenModel {
    
    private let dbService: DBService
    
    init(dbService: DBService) {
        self.dbService = dbService
    }
    
    func sendAnswers(completion: @escaping (_ answers: [Answer]) -> Void) {
        dbService.fetchAnswers(isLocal: false) { (answers) in
            completion(answers)
        }
    }
}

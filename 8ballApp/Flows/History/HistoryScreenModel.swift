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
    
    func sendAnswers() -> [Answer] {
        dbService.fetchAnswers(isLocal: false).map { (answer) in
            return answer
        }
    }
}

//
//  HistoryScreenModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 24.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class HistoryScreenModel {
    
    private let answerHistoryManager: AnswerHistoryManager
    
    init(localManager: AnswerHistoryManager) {
        self.answerHistoryManager = localManager
    }
    
    func sendAnswers() -> [Answer?] {
        answerHistoryManager.fetchAnswers().map { (answer) in
            return answer
        }
    }
    
    func deleteAnswer(_ selectedAnswer: Answer) {
        answerHistoryManager.deleteAnswer(selectedAnswer)
    }
}

//
//  RandomAnswer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class BallModel {
    
    private let randomAnswerManager: NetworkManager
    private let answerHistoryManager: AnswerHistoryManager
    
    init(networkManager: RandomAnswerManager, localManager: AnswerHistoryManager) {
        self.randomAnswerManager = networkManager
        self.answerHistoryManager = localManager
    }

    func fetchData(completion: @escaping (_ answer: String?) -> Void) {
        randomAnswerManager.fetchData { (answer) in
            completion(answer)
        }
    }
    
    func saveAnswer(_ answer: String?, date: Date?) {
        answerHistoryManager.saveAnswer(withText: answer, date: date)
    }
}

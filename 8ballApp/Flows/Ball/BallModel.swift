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
    private let dbService: DBService
    
    init(networkManager: RandomAnswerManager, dbService: DBService) {
        self.randomAnswerManager = networkManager
        self.dbService = dbService
    }
    
    func fetchData(completion: @escaping (_ answer: String?) -> Void) {
        randomAnswerManager.fetchData { (answer) in
            guard let presentableAnswer = answer else { return }
            self.saveAnswer(presentableAnswer)
            completion(presentableAnswer.text)
        }
    }
    
    func saveAnswer(_ answer: Answer) {
        self.dbService.saveAnswers(answers: [answer])
    }
}

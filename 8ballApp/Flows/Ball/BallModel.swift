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
    
    init(randomAnswerManager: RandomAnswerManager) {
        self.randomAnswerManager = randomAnswerManager
    }

    func fetchData(completion: @escaping (_ answer: String?) -> Void) {
        randomAnswerManager.fetchData { (answer) in
            completion(answer)
        }
    }
}

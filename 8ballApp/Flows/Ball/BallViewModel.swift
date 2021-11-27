//
//  RandomAnswerViewModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 13.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class BallViewModel {
    
    private let ballModel: BallModel
    
    init(model: BallModel) {
        self.ballModel = model
    }
    
    func updateInterface(completion: @escaping (_ answer: String?) -> Void) {
        ballModel.fetchData { (answer) in
            let formattedAnswer = answer?.uppercased()
            completion(formattedAnswer)
        }
    }
    
    func saveAnswer(_ answer: String?, _ date: Date?) {
        ballModel.saveAnswer(answer, date)
    }
}

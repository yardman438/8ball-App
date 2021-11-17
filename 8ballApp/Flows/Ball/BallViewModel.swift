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
    
    init(ballModel: BallModel) {
        self.ballModel = ballModel
    }
    
    func updateInterface(completion: @escaping (_ answer: String?) -> Void) {
        ballModel.fetchData { (answer) in
            let formattedAnswer = answer?.uppercased()
            completion(formattedAnswer)
        }
    }
}

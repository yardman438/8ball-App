//
//  RandomAnswer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

// Get data from decoding API's JSON data and initialize to RandomAnswerData's properties
struct RandomAnswer {
    let answerText: String
    let answerType: String
    
    init?(randomAnswerData: RandomAnswerData) {
        answerText = randomAnswerData.magic.answer
        answerType = randomAnswerData.magic.type
    }
}

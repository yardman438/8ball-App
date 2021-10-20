//
//  RandomAnswer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//

import Foundation

struct RandomAnswer {
    let answerText: String
    let answerType: String
    
    init?(randomAnswerData: RandomAnswerData) {
        answerText = randomAnswerData.magic.answer
        answerType = randomAnswerData.magic.type
    }
}

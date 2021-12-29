//
//  RandomAnswerData.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

struct ApiResponseData: Codable {
    let magic: Magic
    
    func toAnswer() -> Answer {
        return Answer(text: magic.answer)
    }
}

struct Magic: Codable {
    let answer: String
    let type: String
}

//
//  PresentableAnswer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 30.11.2021.
//

import Foundation

struct PresentableAnswer: Codable {
    let text: String
    let date: Date

    init(text: String, date: Date = Date()) {
        self.text = text
        self.date = date
    }
}

extension PresentableAnswer {
    func toAnswer() -> Answer {
        return Answer(text: self.text, date: self.date)
    }
}

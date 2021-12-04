//
//  Answer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 29.11.2021.
//

import Foundation

struct Answer: Codable, Equatable {
    let text: String
    let date: Date
    let isLocal: Bool

    init(text: String, date: Date = Date(), isLocal: Bool = false) {
        self.text = text
        self.date = date
        self.isLocal = isLocal
    }
}

extension Answer {
    func toPresentable() -> PresentableAnswer {
        return PresentableAnswer(text: self.text, date: self.date, isLocal: self.isLocal)
    }
}

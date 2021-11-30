//
//  Answer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 29.11.2021.
//

import Foundation

struct Answer: Codable {
    let text: String
    let date: Date

    init(text: String, date: Date = Date()) {
        self.text = text
        self.date = date
    }
}

extension Answer {
    func toManaged(isLocal: Bool) -> ManagedAnswer {
        return ManagedAnswer(text: self.text, date: Date(), isLocal: isLocal)
    }
}

extension Answer {
    func toPresentable() -> PresentableAnswer {
        return PresentableAnswer(text: self.text, date: self.date)
    }
}

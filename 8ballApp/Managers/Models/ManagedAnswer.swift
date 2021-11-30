//
//  ManagedAnswer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 29.11.2021.
//

import Foundation

struct ManagedAnswer: Codable, Equatable {
    let text: String
    let date: Date
    let isLocal: Bool
}

extension ManagedAnswer {
    func toAnswer() -> Answer {
        return Answer(text: self.text, date: self.date)
    }
}

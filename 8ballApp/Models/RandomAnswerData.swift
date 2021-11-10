//
//  RandomAnswerData.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//

import Foundation

// Get data from RandomAnswer
struct RandomAnswerData: Codable {
    let magic: Magic
}

struct Magic: Codable {
    let answer: String
    let type: String
}

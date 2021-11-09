//
//  CustomAnswer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 08.11.2021.
//

import Foundation

// Create CustomAnswer object with struct
public struct CustomAnswer {
    public let text: String
}

// Create an array of CustomAnswers
public struct CustomAnswersArray {
    public var customAnswers: [CustomAnswer]
    public let type: String
}

// An extension for CustomAnswersArray. It consists of method in which custom answers are listed and returned as an array
extension CustomAnswersArray {
    public static func setCustomAnswersArray() -> CustomAnswersArray {
        var customAnswers = [CustomAnswer(text: "Just do it!"),
                             CustomAnswer(text: "I think it's yes!"),
                             CustomAnswer(text: "No."),
                             CustomAnswer(text: "I don't think so..."),
                             CustomAnswer(text: "Shake it again.")]
        
        return CustomAnswersArray(customAnswers: customAnswers, type: "custom")
    }
}

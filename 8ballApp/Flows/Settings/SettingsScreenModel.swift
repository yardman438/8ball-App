//
//  CustomBallModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 14.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class SettingsScreenModel {
    private var customAnswers = [L10n.justdoit,
                                 L10n.ithinkitsyes,
                                 L10n.no,
                                 L10n.idontthinkso,
                                 L10n.shakeitagain]
    
    func sendCustomAnswers() -> [String] {
        return customAnswers
    }
    
    func addNewAnswer(_ answer: String) {
        return customAnswers.append(answer)
    }
}

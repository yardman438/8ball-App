//
//  SettingsScreenViewModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 14.11.2021.
//

import Foundation

class SettingsScreenViewModel {
    private let settingsScreenModel = SettingsScreenModel()
    var customAnswers: [String]? = [L10n.justdoit,
                                    L10n.ithinkitsyes,
                                    L10n.no,
                                    L10n.idontthinkso,
                                    L10n.shakeitagain]

    func addNewAnswer(_ answer: String) {
        self.customAnswers?.append(answer)
    }
}

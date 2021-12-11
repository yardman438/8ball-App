//
//  UserDefaultsManager.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 25.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class UserDefaultsManager {

    private let defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }

    var defaultAnswersArray: [String] {
        get {
            let answers = [L10n.justdoit, L10n.idontthinkso, L10n.ithinkitsyes, L10n.no]
            return defaults.object(forKey: L10n.defaultsKey) as? [String] ?? answers
        }
        set {
            defaults.set(newValue, forKey: L10n.defaultsKey)
        }
    }
}

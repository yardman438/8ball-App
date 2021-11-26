//
//  UserDefaultsManager.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 25.11.2021.
//

import Foundation

class UserDefaultsManager {

    private let defaults = UserDefaults.standard

    var defaultAnswersArray: [String] {
        get {
            let answers = [L10n.justdoit]
            return defaults.object(forKey: L10n.defaultsKey) as? [String] ?? answers
        }
        set {
            defaults.set(newValue, forKey: L10n.defaultsKey)
        }
    }
}

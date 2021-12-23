//
//  KeychainManager.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 21.12.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation
import KeychainSwift

final class KeychainManager {
    
    private var keychain = KeychainSwift()
    private let key = "key"
    
    func getCount() -> Int {
        if let countString = get(for: key) {
            if var count = Int(countString) {
                count += 1
                set(value: String(count), for: key)
                return count
            } else {
                return 0
            }
        } else {
            set(value: "1", for: key)
            return 1
        }
    }
    
    func clearCount() {
        keychain.clear()
    }
    
    private func set(value: String, for key: String) {
        keychain.set(value, forKey: key)
    }
    
    private func get(for key: String) -> String? {
        keychain.get(key)
    }
}

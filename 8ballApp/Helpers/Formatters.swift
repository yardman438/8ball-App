//
//  Formatters.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 29.11.2021.
//

import Foundation

enum Formatters {
    enum Date {
        static let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy HH:mm"
            return formatter
        }()
    }
}

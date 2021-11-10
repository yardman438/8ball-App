//
//  SettingsScreenView.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 08.11.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

class SettingsScreenView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    func configure() {
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = 100
    }
}

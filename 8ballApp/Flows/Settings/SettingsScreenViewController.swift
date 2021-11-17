//
//  SettingsScreenViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 08.11.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

class SettingsScreenViewController: UIViewController {
    
    var settingsScreenViewModel: SettingsScreenViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func addCustomAnswerButtonPressed(_ sender: UIButton) {
        presentCustomAnswerEditAlertController(withTitle: L10n.alertTitle,
                                               message: nil,
                                               style: .alert) { [unowned self] answer in
            settingsScreenViewModel.addNewAnswer(answer)
            tableView.reloadData()
        }
    }
}

// MARK: Extensions

private extension SettingsScreenViewController {
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsScreenViewModel.updateInterface().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: L10n.identifier,
            for: indexPath) as? SettingsScreenTableViewCell
        guard let answerCell = cell else { return UITableViewCell() }
        answerCell.customAnswerLabel.text = settingsScreenViewModel.updateInterface()[indexPath.row]
        return answerCell
    }
}

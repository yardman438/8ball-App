//
//  SettingsScreenViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 08.11.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

class SettingsScreenViewController: UIViewController {

    private let settingsScreenViewModel = SettingsScreenViewModel()
    
    private var settingsScreenView: SettingsScreenView! {
        guard isViewLoaded else { return nil }
        // swiftlint:disable:next force_cast
        return (view as! SettingsScreenView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func addCustomAnswerButtonPressed(_ sender: UIButton) {
        presentCustomAnswerEditAlertController(withTitle: L10n.alertTitle,
                                               message: nil,
                                               style: .alert) { [unowned self] answer in
            settingsScreenViewModel.addNewAnswer(answer)
            settingsScreenView.tableView.reloadData()
        }
    }
}

    // MARK: Extensions

private extension SettingsScreenViewController {
    func configure() {
        settingsScreenView.tableView.delegate = self
        settingsScreenView.tableView.dataSource = self
    }
}

extension SettingsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsScreenViewModel.customAnswers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: L10n.identifier, for: indexPath) as! SettingsScreenTableViewCell
        cell.customAnswerLabel.text = settingsScreenViewModel.customAnswers?[indexPath.row]
        return cell
    }
}

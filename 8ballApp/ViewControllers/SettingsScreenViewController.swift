//
//  SettingsScreenViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 08.11.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

class SettingsScreenViewController: UIViewController {
    
    // Create a variable model and get an array, which was created in CustomAnswer model
    private var customAnswers = CustomAnswers()

    private var settingsScreenView: SettingsScreenView! {
        guard isViewLoaded else { return nil }
        // swiftlint:disable:next force_cast
        return (view as! SettingsScreenView)
    }

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // User interaction with the interface
    @IBAction func addCustomAnswerButtonPressed(_ sender: UIButton) {
        presentCustomAnswerEditAlertController(withTitle: L10n.alertTitle,
                                               message: nil,
                                               style: .alert) { [unowned self] answer in
            customAnswers.customAnswersArray.append(answer)
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
        return customAnswers.customAnswersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: L10n.identifier, for: indexPath) as! SettingsScreenTableViewCell
        cell.customAnswerLabel.text = customAnswers.customAnswersArray[indexPath.row]
        return cell
    }
}

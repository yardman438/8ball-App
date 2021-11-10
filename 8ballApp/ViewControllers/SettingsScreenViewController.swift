//
//  SettingsScreenViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 08.11.2021.
//

import UIKit

class SettingsScreenViewController: UIViewController {
    
    // Create a variable model and get an array, which was created in CustomAnswer model
    private var customAnswers = CustomAnswers()

    
    // We create a computed property with which we check isViewLoaded for unintentional loading of the View when accessing this property. If the view is already loaded, we forcefully convert it to SettingScreenView
    private var settingsScreenView: SettingsScreenView! {
        guard isViewLoaded else { return nil }
        return (view as! SettingsScreenView)
    }

    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // User interaction with the interface
    @IBAction func addCustomAnswerButtonPressed(_ sender: UIButton) {
        presentCustomAnswerEditAlertController(withTitle: "Enter your answer", message: nil, style: .alert) { [unowned self] answer in
            customAnswers.customAnswersArray.append(answer)
            settingsScreenView.tableView.reloadData()
        }
    }
}

    //MARK: - Extensions

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsScreenTableViewCell
        cell.customAnswerLabel.text = customAnswers.customAnswersArray[indexPath.row]
        return cell
    }
}

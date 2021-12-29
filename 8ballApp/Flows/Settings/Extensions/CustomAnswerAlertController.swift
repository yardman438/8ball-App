//
//  CustomAnswerAlertController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

extension SettingsScreenViewController {
    
    // Make an alert controller for editing custom answers on the second screen.
    func presentCustomAnswerEditAlertController(withTitle title: String?,
                                                message: String?,
                                                style: UIAlertController.Style,
                                                completionHandler: @escaping (String) -> Void ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            let customAnswers = [L10n.yesyoucandoit, L10n.maybedont, L10n.thisisgonnahappen]
            textField.placeholder = customAnswers.randomElement()
        }
        
        let saveAction = UIAlertAction(title: L10n.alertSave, style: .default) { _ in
            let textField = alertController.textFields?.first
            guard let customAnswer = textField?.text else { return }
            if customAnswer != "" {
                let answer = customAnswer
                completionHandler(answer)
            }
        }
        let cancelAction = UIAlertAction(title: L10n.alertCancel, style: .cancel) { _ in
            self.alertAnimateOut()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

//
//  CustomAnswerAlertController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//

import UIKit

extension SettingsViewController {
    
    // Make an alert controller for editing custom answers on the second screen.
    func presentCustomAnswerEditAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void ) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let customAnswers = ["Yes, you can do it!", "Maybe don't", "This is gonna happen"]
            tf.placeholder = customAnswers.randomElement()
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let textField = ac.textFields?.first
            guard let customAnswer = textField?.text else { return }
            if customAnswer != "" {
                let answer = customAnswer
                completionHandler(answer)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addAction(saveAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true, completion: nil)
    }
    
}

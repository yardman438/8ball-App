//
//  MainViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

class BallViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var ballViewModel: BallViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        ballViewModel.updateInterface { (answer) in
            DispatchQueue.main.async {
                self.answerLabel.text = answer
            }
        }
    }
    
    @IBAction func shakeButtonPressed(_ sender: UIButton) {
        ballViewModel.updateInterface { (answer) in
            DispatchQueue.main.async {
                self.answerLabel.text = answer
            }
        }
    }
}

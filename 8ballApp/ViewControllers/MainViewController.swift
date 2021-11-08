//
//  MainViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // User interface elements
    @IBOutlet weak var answerLabel: UILabel!
    
    private var answerManager: Networking = AnswerManager()
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerManager.delegate = self
    }
    
    // Sending the request by shaking the device
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        answerManager.fetchData()
    }
    
    // User interaction with the interface
    @IBAction func shakeButtonPressed(_ sender: UIButton) {
        answerManager.fetchData()
    }
}

    //MARK: - Extensions

extension MainViewController: AnswerManagerDelegate {
    func updateInterface(_: AnswerManager, with randomAnswer: RandomAnswer) {
        DispatchQueue.main.async {
            self.answerLabel.text = randomAnswer.answerText
        }
    }
}


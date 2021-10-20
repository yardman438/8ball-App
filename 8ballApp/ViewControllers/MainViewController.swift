//
//  MainViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var answerManager = AnswerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerManager.delegate = self
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        answerManager.fetchRandomAnswer()
    }
    
    @IBAction func shakeButtonPressed(_ sender: UIButton) {
        answerManager.fetchRandomAnswer()
    }
}

extension MainViewController: AnswerManagerDelegate {
    func updateInterface(_: AnswerManager, with randomAnswer: RandomAnswer) {
        DispatchQueue.main.async {
            self.answerLabel.text = randomAnswer.answerText
        }
    }
}


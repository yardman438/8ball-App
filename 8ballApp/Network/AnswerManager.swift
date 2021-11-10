//
//  AnswerManager.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

protocol NetworkManager {
    var delegate: AnswerManagerDelegate? { get set }
    func fetchData()
}

protocol AnswerManagerDelegate: AnyObject {
    func updateInterface(_: AnswerManager, with randomAnswer: RandomAnswer)
}

class AnswerManager: NetworkManager {
    
    weak var delegate: AnswerManagerDelegate?
    
    // Get a random answer from the random answer generator
    func fetchData() {
        let urlString = "https://8ball.delegator.com/magic/JSON/%3Cam_i_superman%3E"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let randomAnswer = self.parseJSON(withData: data) {
                    self.delegate?.updateInterface(self, with: randomAnswer)
                }
            }
        }
        task.resume()
    }
    
    // Decode JSON data
    private func parseJSON(withData data: Data) -> RandomAnswer? {
        let decoder = JSONDecoder()
        do {
            let answerData = try decoder.decode(RandomAnswerData.self, from: data)
            guard let randomAnswer = RandomAnswer(randomAnswerData: answerData) else { return nil }
            return randomAnswer
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

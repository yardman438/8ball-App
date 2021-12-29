//
//  HistoryScreenViewModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 24.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation

class HistoryScreenViewModel {
    
    private let historyScreenModel: HistoryScreenModel
    var answersHistory: [Answer] = []
    
    init(model: HistoryScreenModel) {
        self.historyScreenModel = model
    }
    
    func updateInterface(completion: @escaping (_ isDone: Bool) -> Void) {
        historyScreenModel.sendAnswers(completion: { [weak self] (answers) in
            guard let self = self else { return }
            self.answersHistory = answers
            completion(true)
        })
    }
}

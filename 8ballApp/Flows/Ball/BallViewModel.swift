//
//  RandomAnswerViewModel.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 13.11.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation
import RxSwift

class BallViewModel {
    
    private let ballModel: BallModel
    
    private let disposeBag = DisposeBag()
    
    init(model: BallModel) {
        self.ballModel = model
    }
    
    func updateInterface() -> Observable<String?> {
        return Observable.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            self.ballModel.fetchData()
                .subscribe { answer in
                    let formattedAnswer = answer?.uppercased()
                    observer.on(.next(formattedAnswer))
                } onError: { error in
                    print(error)
                } .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    func saveAnswer(_ answer: String) {
        let newAnswer = Answer(text: answer, date: Date(), isLocal: false)
        ballModel.saveAnswer(newAnswer)
    }
    
    func getAnswerCount() -> String {
        String(ballModel.getAnswerCount())
    }
    
    func clearCount() {
        ballModel.clearCount()
    }
}

//
//  RandomAnswer.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation
import RxSwift

final class BallModel {
    
    private let randomAnswerManager: NetworkManager
    private let dbService: DBService
    
    private let disposeBag = DisposeBag()
    
    init(networkManager: RandomAnswerManager, dbService: DBService) {
        self.randomAnswerManager = networkManager
        self.dbService = dbService
    }
    
    func fetchData() -> Observable<String?> {
        return Observable.create { observer in
            self.randomAnswerManager.fetchData()
                .observe(on: MainScheduler.asyncInstance)
                .subscribe { answer in
                    if let answer = answer {
                        observer.on(.next(answer))
                    }
                } onError: { error in
                    print(error)
                } .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
//    func saveAnswer(_ answer: Answer) {
//        self.dbService.saveAnswers(answers: [answer])
//    }
}

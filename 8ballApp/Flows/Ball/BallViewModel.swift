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
        return Observable.create { observer in
            self.ballModel.fetchData()
                .observe(on: MainScheduler.asyncInstance)
                .subscribe { answer in
                    let formattedAnswer = answer?.uppercased()
                    observer.on(.next(formattedAnswer))
                } onError: { error in
                    print(error)
                } .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
}

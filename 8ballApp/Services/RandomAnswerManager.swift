//
//  AnswerManager.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import Foundation
import RxSwift
import RxCocoa

protocol NetworkManager {
    func fetchData() -> Observable<String?>
}

class RandomAnswerManager: NetworkManager {
    
    func fetchData() -> Observable<String?> {

        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/question") else {
            return Observable.just(nil)
        }
        
        let request = URLRequest(url: url)
                return URLSession.shared.rx.response(request: request)
                    .map { result -> Data in
                        guard result.response.statusCode == 200 else {
                            throw FetchError.invalidResponse(result.response)
                        }
                        return result.data
                    }.map { data in
                        do {
                            let apiResponse = try JSONDecoder().decode(
                                ApiResponseData.self, from: data
                            )
                            let answer = apiResponse.magic.answer
                            return answer
                        } catch let error {
                            throw FetchError.invalidJSON(error)
                        }
                    }
                    .observe(on: MainScheduler.instance)
                    .asObservable()
    }
}

extension RandomAnswerManager {
    private enum FetchError: Error {
        case invalidResponse(URLResponse?)
        case invalidJSON(Error)
    }
}

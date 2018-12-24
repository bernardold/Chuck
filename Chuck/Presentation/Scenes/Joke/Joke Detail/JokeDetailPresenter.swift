//
//  JokeDetailPresenter.swift
//  Chuck
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct JokeDetailPresenter {
    let disposeBag: DisposeBag = DisposeBag()
    weak var view: JokeDetailView?
    let getJokeUseCase: Domain.GetRandomJokeUseCase
}

extension JokeDetailPresenter {
    func setup() {
        view?.askForJoke
            .map({ $0.lowercased() })
            .map({ GetRandomJokeUseCase.Request(category: $0) })
            .flatMap({ request in
                self.getJokeUseCase.getSingle(request: request)
                    .do(onSubscribe: { () in
                        self.view?.startLoading()
                    })
                    .map({ $0.toViewModel() })
                    .do(onSuccess: { jokeVM in
                        self.view?.stopLoading()
                        self.view?.displayJoke(viewModel: jokeVM)
                    }, onError: { error in
                        guard let domainError = error as? DomainError else {
                            // TODO: handle error
                            return
                        }
                        // TODO: handle domain error
                    })
                    .asCompletable()
                    .catchError({ _ in Completable.empty() })
            })
            .subscribe()
            .disposed(by: disposeBag)

    }
}

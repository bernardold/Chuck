//
//  CategoriesPresenter.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import RxSwift

struct CategoriesPresenter {
    let disposeBag: DisposeBag = DisposeBag()
    weak var view: CategoriesView?
    let getCategoriesUseCase: Domain.GetCategoriesUseCase
}

extension CategoriesPresenter {
    func setup() {
        view?.askForCategories
            .flatMap({ _ in
                self.getCategoriesUseCase.getSingle()
                    .do(onSubscribe: { () in
                        self.view?.startLoading()
                    })
                    .map({ $0.toViewModel() })
                    .do(onSuccess: { categoriesVM in
                        self.view?.stopLoading()
                        self.view?.displayCategories(viewModel: categoriesVM)
                    }, onError: { error in
                        self.view?.stopLoading()
                        guard let domainError = error as? DomainError else {
                            self.view?.displayError(withMessage: "Not even Chuck Norris knows what happened. Please try again.",
                                                    showTryAgainButton: true)
                            return
                        }
                        switch domainError {
                        case .notConnectedToInternet:
                            self.view?.displayError(withMessage: "Apparently Chuck Norris Roundhouse kicked your Internet.\nCheck your connection and try again.",
                                               showTryAgainButton: true)
                        default:
                            self.view?.displayError(withMessage: "Not even Chuck Norris knows what happened. Please try again.",
                                               showTryAgainButton: true)
                        }
                    })
                    .asCompletable()
                    .catchError({ _ in Completable.empty() })
            })
            .subscribe()
            .disposed(by: disposeBag)

        view?.onSelectCategory
            .subscribe(onNext: { category in
                self.view?.displayJoke(fromCategory: category)
            })
            .disposed(by: disposeBag)
    }
}

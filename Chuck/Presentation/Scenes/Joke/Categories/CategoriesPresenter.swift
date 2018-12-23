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
        getCategoriesUseCase.getSingle()
            .do(onSubscribe: { () in
                self.view?.startLoading()
            })
            .map({ $0.toViewModel() })
            .subscribe(onSuccess: { categoriesVM in
                self.view?.stopLoading()
                self.view?.displayCategories(viewModel: categoriesVM)
            }, onError: { error in
                guard let domainError = error as? DomainError else {
                    // TODO: handle error
                    return
                }
                // TODO: handle domain error
            })
            .disposed(by: disposeBag)

        view?.onSelectCategory
            .subscribe(onNext: { category in
                self.view?.displayJoke(fromCategory: category)
            })
            .disposed(by: disposeBag)
    }
}

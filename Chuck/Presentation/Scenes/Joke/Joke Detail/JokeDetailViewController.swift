//
//  JokeDetailViewController.swift
//  Chuck
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

protocol JokeDetailView: CoordinatorHolderView {
    var askForJoke: Observable<String> { get }

    func displayJoke(viewModel: JokeDetailViewModel)
    func displayError(withMessage errorMessage: String)
    func startLoading()
    func stopLoading()
}

class JokeDetailViewController: UIViewController {
    weak var coordinator: Coordinator?
    var presenter: JokeDetailPresenter!
    let disposeBag = DisposeBag()

    var askForJoke: Observable<String> { return askForJokeSubject }
    private var askForJokeSubject = PublishSubject<String>()

    var selectedCategory: String!
    var jokeExternalUrl: String!

    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var factLabel: UILabel!
    @IBOutlet private var externalLinkButton: UIButton!
    @IBOutlet private var refreshButton: UIButton!
    @IBOutlet private var loadingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupObservables()
        presenter.setup()
        askForJokeSubject.onNext(selectedCategory)
    }
}

extension JokeDetailViewController {
    fileprivate func setupView() {
        externalLinkButton.layer.cornerRadius = 5.0
        refreshButton.layer.cornerRadius = 5.0
    }

    fileprivate func setupObservables() {
        externalLinkButton.rx.tap.asObservable()
            .do(onNext: { [weak self] () in
                guard let self = self,
                    let url = URL(string: self.jokeExternalUrl) else { return () }
                UIApplication.shared.openURL(url)
            })
            .subscribe()
            .disposed(by: disposeBag)

        refreshButton.rx.tap.asObservable()
            .map({ [weak self] _ in
                guard let self = self else { return "" }
                return self.selectedCategory
            })
            .bind(to: askForJokeSubject)
            .disposed(by: disposeBag)
    }
}

extension JokeDetailViewController: JokeDetailView {
    func displayJoke(viewModel: JokeDetailViewModel) {
        let imageUrl = URL(string: viewModel.imageUrl)
        imageView.kf.setImage(with: imageUrl)
        factLabel.text = viewModel.fact
        jokeExternalUrl = viewModel.externalUrl
        stackView.isHidden = false
        externalLinkButton.isEnabled = true
        refreshButton.isEnabled = true
    }

    func displayError(withMessage errorMessage: String) {
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            // Do not pop if refreshing
            guard let self = self, self.stackView.isHidden else { return }
            self.coordinator?.pop()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func startLoading() {
        loadingView.isHidden = false
    }

    func stopLoading() {
        loadingView.isHidden = true
    }
}

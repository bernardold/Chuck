//
//  CategoriesViewController.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CategoriesView: CoordinatorHolderView {
    func displayCategories(viewModel: CategoriesViewModel)
    func startLoading()
    func stopLoading()
}

class CategoriesViewController: UIViewController {
    weak var coordinator: Coordinator?
    var presenter: CategoriesPresenter!
    let disposeBag = DisposeBag()

    var dataSource = [String]()

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupObservables()
        presenter.askForCategories()
    }
}

extension CategoriesViewController {
    fileprivate func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesTableViewCell.nib,
                           forCellReuseIdentifier: CategoriesTableViewCell.identifier)
    }

    fileprivate func setupObservables() {
        tableView.rx.itemSelected.asObservable()
            .do(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .subscribe()
            .disposed(by: disposeBag)

    }
}

extension CategoriesViewController: CategoriesView {
    func displayCategories(viewModel: CategoriesViewModel) {
        dataSource = viewModel.categories
        tableView.reloadData()
    }

    func startLoading() {
        loadingView.isHidden = false
    }

    func stopLoading() {
        loadingView.isHidden = true
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier) as? CategoriesTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
}

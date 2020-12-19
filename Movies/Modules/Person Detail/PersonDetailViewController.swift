//
//  PersonDetailViewController.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension PersonDetailViewController: IPersonDetailView {
    func setupPersonDetailView(with personDetailItem: PersonDetail) {
        personDetailView.setup(with: personDetailItem)
    }
}
class PersonDetailViewController: UIViewController {

    // MARK: Properties
    var presenter: IPersonDetailPresenter?

    lazy var personDetailView: PersonDetailView = {
        let movieView = PersonDetailView(frame: CGRect(x: 0, y: view.frame.origin.y + 60,
                                                       width: view.frame.width, height: 500))
        movieView.backgroundColor = .paleGrey

        return movieView
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        view.backgroundColor = .paleGrey
        view.add(subviews: personDetailView)
    }
}

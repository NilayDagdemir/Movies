//
//  MainViewController.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 16.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Properties
    var presenter: IMainPresenter?
    var adapter: MainTableViewAdapter?

    private var movieListTableView: UITableView?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        title = "Popular Movies"
        setupTableView()
    }

    private func setupTableView() {
        movieListTableView = UITableView(frame: view.frame)
        movieListTableView?.backgroundColor = .paleGrey
        movieListTableView?.separatorStyle = .singleLine
        view.addSubview(movieListTableView ?? UITableView())

        movieListTableView?.delegate = adapter
        movieListTableView?.dataSource = adapter
        movieListTableView?.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.nameOfClass)

        movieListTableView?.pinToEdges(to: view)
    }
}

extension MainViewController: IMainView {
    func reloadTableView() {
        movieListTableView?.reloadData()
    }
}


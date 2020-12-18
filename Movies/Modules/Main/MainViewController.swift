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

    lazy var movieListTableView: UITableView = {
        let tableView = UITableView(frame: view.frame)
        tableView.backgroundColor = .paleGrey
        tableView.separatorStyle = .singleLine

        return tableView
    }()

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
        view.addSubview(movieListTableView)

        movieListTableView.delegate = adapter
        movieListTableView.dataSource = adapter
        movieListTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.nameOfClass)

        movieListTableView.pinToEdges(to: view)
    }
}

extension MainViewController: IMainView {
    func reloadTableView() {
        movieListTableView.reloadData()
    }
}


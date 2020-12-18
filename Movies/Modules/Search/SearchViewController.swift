//
//  SearchViewController.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: Properties
    var presenter: ISearchPresenter?
    var adapter: SearchTableViewAdapter?

    private var filteredMovieListTableView: UITableView?
    private var searchBar = UISearchBar()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        title = "Search Movies"
        setupSearchBar()
        setupTableView()
    }

    private func setupSearchBar() {
        searchBar.sizeToFit()
        searchBar.delegate = self
        closeSearchBar()
    }

    private func setupTableView() {
        filteredMovieListTableView = UITableView(frame: view.frame)
        filteredMovieListTableView?.rowHeight = 188
        filteredMovieListTableView?.backgroundColor = .paleGrey

        view.addSubview(filteredMovieListTableView ?? UITableView())

        filteredMovieListTableView?.delegate = adapter
        filteredMovieListTableView?.dataSource = adapter
        filteredMovieListTableView?.register(MovieTableViewCell.self, forCellWithReuseIdentifier: MovieTableViewCell.nameOfClass)

        filteredMovieListTableView?.pinToEdges(to: view)
    }

    private func closeSearchBar() {
        searchBar.resignFirstResponder()
        navigationItem.titleView = nil
        searchBar.showsCancelButton = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
    }

    @objc func showSearchBar() {
        searchBar.becomeFirstResponder()
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
    }
}

extension SearchViewController: ISearchView {
    // TODO: implement view output methods
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        closeSearchBar()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.filterItems(with: searchBar.text ?? "")
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter?.filterItems(with: searchBar.text ?? "")
    }
}

extension SearchViewController: ISearchView {
    func reloadTableView() {
        filteredMovieListTableView?.reloadData()
    }
}

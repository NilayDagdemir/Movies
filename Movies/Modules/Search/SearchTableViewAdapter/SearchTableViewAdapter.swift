//
//  SearchTableViewAdapter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SearchTableViewAdapter: NSObject {
    private let presenter: ISearchPresenter

    init(presenter: ISearchPresenter) {
        self.presenter = presenter
    }
}

extension SearchTableViewAdapter: IBaseAdapter {
    func itemCount(on section: Int) -> Int {
        getFilteredMovies().count
    }

    func getFilteredMovies() -> [Movie] {
        return presenter.getFilteredMovies()
    }
}

extension SearchTableViewAdapter: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount(on: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupFilteredMovieTableViewCell(tableView: tableView, indexPath: indexPath)
    }

    private func setupFilteredMovieTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let identifier = MovieTableViewCell.nameOfClass
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? MovieTableViewCell {
            cell.setup(with: getFilteredMovies()[indexPath.row])

            return cell
        }
        return UITableViewCell()
    }
}

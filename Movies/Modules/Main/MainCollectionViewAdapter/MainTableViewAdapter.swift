//
//  MainTableViewAdapter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 16.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MainTableViewAdapter: NSObject {
    private let presenter: IMainPresenter

    init(presenter: IMainPresenter) {
        self.presenter = presenter
    }
}

extension MainTableViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
        return getMovieList().count
    }

    func getMovieList() -> [Movie] {
        return presenter.getMovieList()
    }
}

extension MainTableViewAdapter: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupMovieTableViewCell(tableView: tableView, indexPath: indexPath)
    }

    private func setupMovieTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let identifier = MovieTableViewCell.nameOfClass
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? MovieTableViewCell {
            cell.setup(with: getMovieList()[indexPath.row])

            return cell
        }
        return UITableViewCell()
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let movieItem = model.movieItem(at: indexPath), let id = movieItem.id else {
//            tableView.deselectRow(at: indexPath, animated: true)
//            return
//        }
//        let controller = MovieDeatilsVC(movieId: id)
//        controller.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(controller, animated: true)
//    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

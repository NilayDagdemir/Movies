//
//  MainViewController.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var apiManager: APIClientInterface?
    var movieList: [Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("here entered main view controller")
        commonInit()
        // Do any additional setup after loading the view.
    }

    private func commonInit() {
        apiManager = APIClient()
        view = MainView()
        // TODO: nav bar title ver.
//        (view as! AllMoviesView).setTableViewDataSourceDelegate(dataSourceDelegate: self)
    }

    func retrieveMovieList() {
        apiManager?.getPopularMovies(onSuccess: { [weak self] response in
            guard let self = self else { return }
            print("here response is: \(response) and result: \(response.results)")
            if let movieList = response.results?.results {
                self.movieList = movieList
            }
            }, onError: { [weak self] (error) in
                guard let self = self else { return }
                self.showErrorDialog(with: error?.statusMessage ?? Constants.Error.defaultErrorMessage)
        })
    }
}

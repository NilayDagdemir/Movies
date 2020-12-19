//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {

    // MARK: Properties
    var presenter: IMovieDetailPresenter?
    var adapter: MovieDetailCollectionViewAdapter?

    lazy var movieDetailView: MovieDetailView = {
        // swiftlint:disable:next line_length
        let movieView = MovieDetailView(frame: CGRect(x: 0, y: view.frame.origin.y + 60, width: view.frame.width, height: 500))
        movieView.backgroundColor = .paleGrey

        return movieView
    }()

    lazy var movieDetailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .paleGrey

        return collectionView
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .paleGrey
        view.add(subviews: movieDetailView, movieDetailCollectionView)

        setupCollectionView()
        setupConstraints()
    }

    private func setupCollectionView() {
        movieDetailCollectionView.delegate = adapter
        movieDetailCollectionView.dataSource = adapter
        movieDetailCollectionView.register(SectionHeaderCell.self,
                                           forCellWithReuseIdentifier: SectionHeaderCell.nameOfClass)
        movieDetailCollectionView.register(CastCollectionViewCell.self,
                                           forCellWithReuseIdentifier: CastCollectionViewCell.nameOfClass)
        movieDetailCollectionView.register(VideoCollectionViewCell.self,
                                           forCellWithReuseIdentifier: VideoCollectionViewCell.nameOfClass)
    }

    private func setupConstraints() {
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0

        movieDetailView.translatesAutoresizingMaskIntoConstraints = false
        movieDetailView.topAnchor.constraint(equalTo: view.topAnchor, constant: navBarHeight).isActive = true
        movieDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        movieDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        movieDetailView.heightAnchor.constraint(equalToConstant: 500).isActive = true

        movieDetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        // swiftlint:disable:next line_length
        movieDetailCollectionView.topAnchor.constraint(equalTo: movieDetailView.bottomAnchor, constant: 40).isActive = true
        movieDetailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        movieDetailCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        movieDetailCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension MovieDetailViewController: IMovieDetailView {
    func reloadCollectionView() {
        movieDetailCollectionView.reloadData()
    }

    func setMovieDetailItem(to item: MovieDetail) {
        movieDetailView.setup(with: item)
    }

    func setTitle(to title: String) {
        self.title = title
    }
}

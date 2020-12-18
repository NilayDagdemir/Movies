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

    lazy var movieDetailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //        layout.itemSize = CGSize(width: 60, height: 60)
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
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
        title = "Movie Details"
        setupCollectionView()
    }

    private func setupCollectionView() {
//        view.addSubview(movieDetailCollectionView)
//
//        movieDetailCollectionView.delegate = adapter
//        movieDetailCollectionView.dataSource = adapter
//        movieDetailCollectionView.register(CastCollectionViewCell.self, forCellWithReuseIdentifier: CastCollectionViewCell.nameOfClass)
//        movieDetailCollectionView.pinToEdges(to: view)
    }
}

extension MovieDetailViewController: IMovieDetailView {
    func reloadCollectionView() {
        movieDetailCollectionView.reloadData()
    }
}

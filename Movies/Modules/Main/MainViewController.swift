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
    var adapter: MainCollectionViewAdapter?

    private var movieListCollectionView: UICollectionView?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        title = "Popular Movies"
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 188)
//        layout.scrollDirection = .horizontal
        layout.scrollDirection = .vertical
        movieListCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        movieListCollectionView?.backgroundColor = .paleGrey
        

        view.addSubview(movieListCollectionView ?? UICollectionView())

        movieListCollectionView?.delegate = adapter
        movieListCollectionView?.dataSource = adapter
        movieListCollectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.nameOfClass)
        
        movieListCollectionView?.pinToEdges(to: view)
    }
}

extension MainViewController: IMainView {
    func reloadCollectionView() {
        movieListCollectionView?.reloadData()
    }
}



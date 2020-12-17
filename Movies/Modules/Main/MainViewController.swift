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
        print("here view")
        super.viewDidLoad()
        presenter?.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        // arka planım neden siyah görünüyor?
        movieListCollectionView?.backgroundColor = .lightGray
        title = "Movies"
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        movieListCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)

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



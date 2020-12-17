//
//  MainCollectionViewAdapter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 16.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MainCollectionViewAdapter: NSObject {
    private let presenter: IMainPresenter

    init(presenter: IMainPresenter) {
        self.presenter = presenter
    }
}

extension MainCollectionViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
//        return presenter.getMovieList().count
        return 1
    }

    func sectionCount() -> Int {
        return 1 // update here
    }

    func getMovieList() -> [Movie] {
        return presenter.getMovieList()
    }
}

extension MainCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - Collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setupMovieCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
    }

    private func setupMovieCollectionViewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = MovieCollectionViewCell.nameOfClass
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if let cell = cell as? MovieCollectionViewCell {
//            cell.setup(with: getMovieList()[indexPath.row])

            return cell
        }
        return UICollectionViewCell()
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return GuestOperationConstants.TTStore.storeDetailCollectionViewMinLineSpacing
//    }
}

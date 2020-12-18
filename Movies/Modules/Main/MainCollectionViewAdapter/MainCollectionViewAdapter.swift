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
    func itemCount(on section: Int) -> Int {
        switch section {
        case 0:
            return getMovieList().count
        case 1:
            return 0
        case 2:
            return 0
        default:
            return 0
        }
    }

    func sectionCount() -> Int {
        // filteredItems a göre section sayısı belirlenecek.
        return 1
    }

    func getMovieList() -> [Movie] {
        return presenter.getMovieList()
    }
}

extension MainCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionCount()
    }

    // MARK: - Collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount(on: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
//        switch section {
//        case 0:
            return setupMovieCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
//        case 1:
//            return UICollectionViewCell()
//        case 2:
//            return UICollectionViewCell()
//        default:
//            return UICollectionViewCell()
//        }
    }

    private func setupMovieCollectionViewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = MovieCollectionViewCell.nameOfClass
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if let cell = cell as? MovieCollectionViewCell {
            cell.setup(with: getMovieList()[indexPath.row])

            return cell
        }
        return UICollectionViewCell()
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return GuestOperationConstants.TTStore.storeDetailCollectionViewMinLineSpacing
//    }
}

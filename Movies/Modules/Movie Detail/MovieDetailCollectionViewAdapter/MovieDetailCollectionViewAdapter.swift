//
//  MovieDetailCollectionViewAdapter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MovieDetailCollectionViewAdapter: NSObject {
    private let presenter: IMovieDetailPresenter

    init(presenter: IMovieDetailPresenter) {
        self.presenter = presenter
    }
}

extension MovieDetailCollectionViewAdapter: IBaseAdapter {
    func itemCount() -> Int {
        return getCast().count
    }

    func getMovieDetails() -> MovieDetail? {
        return presenter.getMovieDetailItem()
    }

    func getVideos() -> [Video] {
        print("here video count: \(presenter.getVideos().count)")
        return presenter.getVideos()
    }

    func getCast() -> [Cast] {
        return presenter.getCast()
    }
}

//extension MovieDetailCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Collection view data source
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return setupMovieDetailCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
//    }
//
//    private func setupMovieDetailCollectionViewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
//        let identifier = CastCollectionViewCell.nameOfClass
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
//        if let cell = cell as? CastCollectionViewCell {
//            cell.setup(with: getCast()[indexPath.row])
//
//            return cell
//        }
//        return UICollectionViewCell()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        // TODO: video seçildiyse oynatılacak, cast'ten biri seçildiyse, person detail ekranına yönlendirecek router üzerinden.
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
//                                                                                   withReuseIdentifier: MovieDetailCollectionViewHeader.nameOfClass,
//                                                                                   for: indexPath) as? MovieDetailCollectionViewHeader else {
//            fatalError("Invalid view type")
//        }
//        print("here movie detail: \(getMovieDetails())")
//        if let movieDetailItem = getMovieDetails() {
//            headerView.setup(with: movieDetailItem)
//        }
//
//        return headerView
//        default:
//            assert(false, "Invalid element type")
//        }
//    }
//}

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
        return presenter.getVideos()
    }

    func getCast() -> [Cast] {
        return presenter.getCast()
    }
}

extension MovieDetailCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setupMovieDetailCollectionViewCell(collectionView: collectionView, indexPath: indexPath)
    }

    private func setupMovieDetailCollectionViewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = CastCollectionViewCell.nameOfClass
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if let cell = cell as? CastCollectionViewCell {
            cell.setup(with: getCast()[indexPath.row])

            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let personId = getCast()[indexPath.row].id {
            presenter.castItemClicked(with: personId)
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let identifier = CastSectionHeader.nameOfClass
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as! CastSectionHeader
            sectionHeader.titleLabel.text = "Cast:"

             return sectionHeader
        } else {
             return UICollectionReusableView()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 20)
    }
}

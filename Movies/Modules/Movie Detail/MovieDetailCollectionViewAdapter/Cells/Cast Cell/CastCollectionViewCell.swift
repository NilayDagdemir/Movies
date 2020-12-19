//
//  CastCollectionViewCell.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    private var castImageView = UIImageView(contentMode: .scaleToFill)

    private var castItem: Cast?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isHeightCalculated: Bool = false
    // swiftlint:disable:next line_length
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        if !isHeightCalculated {
            setNeedsLayout()
            layoutIfNeeded()
            layoutAttributes.frame = CGRect(x: 0, y: 0, width: 40, height: 60)
            isHeightCalculated = true
        }
        return layoutAttributes
    }

    private func configureUI() {
        backgroundColor = .paleGrey
        castImageView.layer.cornerRadius = 10
        castImageView.clipsToBounds = true
        if castItem?.profilePath == nil {
            castImageView.contentMode = .scaleAspectFit
        } else {
            castImageView.contentMode = .scaleAspectFill
        }

        contentView.add(subviews: castImageView)

        setupConstraints()
    }

    func setup(with castItem: Cast) {
        self.castItem = castItem

        if castItem.profilePath == nil {
            castImageView.image = #imageLiteral(resourceName: "icon_no_image")
        } else if let posterPath = castItem.profilePath {
            let posterURL = Config.getPosterURL(with: posterPath, resolution: Constants.PosterProperties.low.resolution)
            ImageDownloadManager.shared.downloadImageForImageView(url: posterURL,
                                                                  imageView: castImageView)
        }
    }

    private func setupConstraints() {
        setImageConstraints()
    }

    private func setImageConstraints() {
        castImageView.translatesAutoresizingMaskIntoConstraints = false
        castImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        castImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        castImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        castImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
    }
}

//
//  MovieDetailView.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

// cast, videos
class MovieDetailView: UIView {
    private var movieCoverPhoto = UIImageView(contentMode: .scaleToFill)
    private var movieSummaryTextView = UITextView(font: .systemFont(ofSize: 14, weight: .light), textColor: .black)
    private var ratingLabel = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .lightGray)

    private var movieDetailItem: MovieDetail?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with movieDetailItem: MovieDetail) {
        self.movieDetailItem = movieDetailItem

        movieSummaryTextView.text = movieDetailItem.overview == "" ? Constants.Error.noOverviewTextExists
                                                                     : movieDetailItem.overview
        if let rating = movieDetailItem.voteAverage {
            ratingLabel.text = "Rating: \(rating)"
        }
        if let posterPath = movieDetailItem.posterPath {
            let posterURL = Config.getPosterURL(with: posterPath,
                                                resolution: Constants.PosterProperties.high.resolution)
            ImageDownloadManager.shared.downloadImageForImageView(url: posterURL,
                                                                  imageView: movieCoverPhoto)
        }
    }

    private func configureUI() {
        backgroundColor = .paleGrey
        preservesSuperviewLayoutMargins = false
        movieCoverPhoto.clipsToBounds = true
        movieCoverPhoto.contentMode = .scaleToFill
        movieSummaryTextView.isEditable = false
        movieSummaryTextView.adjustsFontForContentSizeCategory = true

        add(subviews: movieCoverPhoto, movieSummaryTextView, ratingLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        setImageConstraints()
        setSummaryConstraints()
        setRatingLabelConstraints()
    }

    private func setImageConstraints() {
        movieCoverPhoto.translatesAutoresizingMaskIntoConstraints = false
        movieCoverPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        movieCoverPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        movieCoverPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        movieCoverPhoto.heightAnchor.constraint(equalToConstant: 432).isActive = true
    }

    private func setSummaryConstraints() {
        // swiftlint:disable line_length
        movieSummaryTextView.translatesAutoresizingMaskIntoConstraints = false
        movieSummaryTextView.topAnchor.constraint(equalTo: movieCoverPhoto.bottomAnchor, constant: 10).isActive = true
        movieSummaryTextView.leadingAnchor.constraint(equalTo: movieCoverPhoto.leadingAnchor, constant: 10).isActive = true
        movieSummaryTextView.trailingAnchor.constraint(equalTo: movieCoverPhoto.trailingAnchor, constant: -10).isActive = true
        // swiftlint:enable line_length
        movieSummaryTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setRatingLabelConstraints() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: movieSummaryTextView.bottomAnchor, constant: 10).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: movieSummaryTextView.leadingAnchor, constant: 0).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
}

//
//  MovieDetailCollectionViewHeader.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MovieDetailView: UIView {
    private var movieCoverPhoto = UIImageView(contentMode: .scaleToFill)
    private var movieTitleLabel = UILabel(font: .systemFont(ofSize: 18, weight: .semibold))
    private var movieSummaryTextView = UITextView(font: .systemFont(ofSize: 14, weight: .light), textColor: .darkGray)
    private var rating = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .lightGray)

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

        movieTitleLabel.text = movieDetailItem.title
        movieSummaryTextView.text = movieDetailItem.overview == "" ? Constants.Error.noOverviewTextExists
                                                                     : movieDetailItem.overview
        rating.text = "Rating: \(String(describing: movieDetailItem.voteAverage))"
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

        add(subviews: movieCoverPhoto, movieTitleLabel, movieSummaryTextView, rating)
        setupConstraints()
    }

    private func setupConstraints() {
        setImageConstraints()
        setTitleLabelConstraints()
        setSummaryConstraints()
        setRatingLabelConstraints()
    }

    private func setImageConstraints() {
        movieCoverPhoto.translatesAutoresizingMaskIntoConstraints = false
        movieCoverPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        movieCoverPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        movieCoverPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        movieCoverPhoto.heightAnchor.constraint(equalToConstant: 530).isActive = true
    }

    private func setTitleLabelConstraints() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: movieCoverPhoto.bottomAnchor, constant: 10).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }

    private func setSummaryConstraints() {
        movieSummaryTextView.translatesAutoresizingMaskIntoConstraints = false
        movieSummaryTextView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 10).isActive = true
        movieSummaryTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        movieSummaryTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }

    private func setRatingLabelConstraints() {
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.topAnchor.constraint(equalTo: movieSummaryTextView.bottomAnchor, constant: 10).isActive = true
        rating.leadingAnchor.constraint(equalTo: movieSummaryTextView.trailingAnchor, constant: 10).isActive = true
        rating.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
        rating.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

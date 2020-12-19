//
//  MovieDetailCollectionViewHeader.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

// cast, videos
class MovieDetailView: UIView {
    private var movieCoverPhoto = UIImageView(contentMode: .scaleToFill)
    private var movieTitleLabel = UILabel(font: .systemFont(ofSize: 18, weight: .semibold))
    private var movieSummaryTextView = UITextView(font: .systemFont(ofSize: 14, weight: .light), textColor: .darkGray)
    private var rating = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .lightGray)
//    private var videos = UILabel(font: .systemFont(ofSize: 14, weight: .light), textColor: .lightGray)

    private var movieDetailItem: MovieDetail?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with movieDetailItem: MovieDetail) {
        print("here setting up with:\(movieDetailItem)")
        self.movieDetailItem = movieDetailItem

        movieTitleLabel.text = movieDetailItem.title
//        personDetailImageView.image = #imageLiteral(resourceName: "icon_details")
        print("here overview: \(movieDetailItem.overview)")
        movieSummaryTextView.text = movieDetailItem.overview == "" ? "**No overview exists for this one**" : movieDetailItem.overview
        rating.text = "Rating: \(String(describing: movieDetailItem.voteAverage))"
        if let posterPath = movieDetailItem.posterPath {
            ImageDownloadManager.shared.downloadImageForImageView(url: Config.getPosterURL(with: posterPath,
                                                                                           resolution: Constants.PosterProperties.high.resolution),
                                                                                           imageView: movieCoverPhoto)
        }
        //        videos = movieItem.releaseDate
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
//        setLanguageLabelConstraints()
//        setReleaseDateLabelConstraints()
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
//
//    private func setLanguageLabelConstraints() {
//        rating.translatesAutoresizingMaskIntoConstraints = false
//        languageLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
//        rating.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
//    }
//
//    private func setReleaseDateLabelConstraints() {
//        videos.translatesAutoresizingMaskIntoConstraints = false
//        videos.topAnchor.constraint(equalTo: movieSummaryTextView.bottomAnchor, constant: 15).isActive = true
//        videos.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        videos.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
//        videos.widthAnchor.constraint(equalToConstant: 100).isActive = true
//    }
}

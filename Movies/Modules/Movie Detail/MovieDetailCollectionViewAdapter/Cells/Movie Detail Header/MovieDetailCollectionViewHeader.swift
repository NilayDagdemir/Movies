//
//  MovieDetailCollectionViewHeader.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

// cover photo, title, summary,
// rating, cast, videos
class MovieDetailCollectionViewHeader: UICollectionReusableView {
//    private var movieCoverPhoto = UIImageView(contentMode: .scaleToFill)
//    private var movieTitleLabel = UILabel(font: .systemFont(ofSize: 18, weight: .semibold))
////    private var personDetailImageView = UIImageView(contentMode: .scaleAspectFit)
//    private var movieSummaryTextView = UITextView(font: .systemFont(ofSize: 14, weight: .light), textColor: .darkGray)
//    private var rating = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .lightGray)
////    private var videos = UILabel(font: .systemFont(ofSize: 14, weight: .light), textColor: .lightGray)
//
    private var movieDetailItem: MovieDetail?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with movieDetailItem: MovieDetail) {
        print("here cell enter with movie item: \(movieDetailItem)")
        self.movieDetailItem = movieDetailItem
//        print("here entered.")
//        movieTitleLabel.text = movieDetailItem.title
//        personDetailImageView.image = #imageLiteral(resourceName: "icon_details")
//        movieSummaryTextView.text = movieDetailItem.overview == "" ? "**No overview exists for this one**" : movieDetailItem.overview
//        rating.text = movieDetailItem.voteAverage
//        videos.text = movieItem.releaseDate
//        ImageDownloadManager.shared.downloadImageForImageView(url: Config.getPosterURL(with: movieDetailItem.posterPath, resolution: Constants.PosterProperties.high.resolution), imageView: movieCoverPhoto)
    }

    private func configureUI() {
//        backgroundColor = .paleGrey
//        preservesSuperviewLayoutMargins = false
//        separatorInset = UIEdgeInsets.zero
//        layoutMargins = UIEdgeInsets.zero
//        movieImageView.layer.cornerRadius = 10
//        movieImageView.clipsToBounds = true
//        movieImageView.contentMode = .scaleToFill
//        movieSummaryTextView.isEditable = false
//        contentView.add(subviews: movieImageView, movieTitleLabel, detailsImageView, overviewTextView, languageLabel, releaseDateLabel)
//        setupConstraints()
    }

//    private func setupConstraints() {
//        setImageConstraints()
//        setTitleLabelConstraints()
//        setDetailsImageViewConstraints()
//        setOverviewLabelConstraints()
//        setLanguageLabelConstraints()
//        setReleaseDateLabelConstraints()
//    }
//
//    private func setImageConstraints() {
//        movieImageView.translatesAutoresizingMaskIntoConstraints = false
//        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//        movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//        movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
//        movieImageView.heightAnchor.constraint(equalToConstant: 188).isActive = true
//        movieImageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
//    }
//
//    private func setTitleLabelConstraints() {
//        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
//        movieTitleLabel.trailingAnchor.constraint(equalTo: personDetailImageView.leadingAnchor, constant: -20).isActive = true
//    }
//
//    private func setDetailsImageViewConstraints() {
//        personDetailImageView.translatesAutoresizingMaskIntoConstraints = false
//        personDetailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
//        personDetailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
//        personDetailImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
//        personDetailImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
//    }
//
//    private func setOverviewLabelConstraints() {
//        movieSummaryTextView.translatesAutoresizingMaskIntoConstraints = false
//        movieSummaryTextView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 5).isActive = true
//        overviewTextView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
//        movieSummaryTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//        movieSummaryTextView.bottomAnchor.constraint(lessThanOrEqualTo: rating.topAnchor, constant: -10).isActive = true
//    }
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

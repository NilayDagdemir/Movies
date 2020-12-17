//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 15.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    private var movieImageView = UIImageView()
    private var movieTitleLabel = UILabel()
//    private var overviewTextView = UITextView()
//    private var languageLabel = UILabel()
//    private var releaseDateLabel = UILabel()
    private var posterPath: String = ""

    private var movieItem: Movie?

    func setup(with movieItem: Movie) {
        self.movieItem = movieItem

        setMoviePoster()
        setTitle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        backgroundColor = .white
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true

        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true

//        overviewTextView.isScrollEnabled = true
        addSubview(movieImageView)
        addSubview(movieTitleLabel)
//        addSubview(overviewTextView)
//        addSubview(languageLabel)
//        addSubview(releaseDateLabel)
    }

    private func setMoviePoster() {
        if let posterPath = movieItem?.posterPath {
            ImageDownloadManager.shared.downloadImageForImageView(url: Config.getPosterURL(with: posterPath), imageView: movieImageView)
        }
    }

    private func setTitle() {
        movieTitleLabel.text = movieItem?.title
    }

    private func setImageConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor, multiplier: 16/9).isActive = true
    }

    private func setTitleLabelConstraints() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

}

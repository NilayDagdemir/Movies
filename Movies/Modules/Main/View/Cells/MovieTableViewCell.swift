//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 15.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    private var movieImageView = UIImageView(contentMode: .scaleToFill)
    private var movieTitleLabel = UILabel(font: .systemFont(ofSize: 18, weight: .semibold))
    private var detailsImageView = UIImageView(contentMode: .scaleAspectFit)
    private var overviewTextView = UITextView(font: .systemFont(ofSize: 14, weight: .light), textColor: .darkGray)
    private var languageLabel = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .lightGray)
    private var releaseDateLabel = UILabel(font: .systemFont(ofSize: 14, weight: .light), textColor: .lightGray)

    private var movieItem: Movie?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }

    func setup(with movieItem: Movie) {
        self.movieItem = movieItem

        movieTitleLabel.text = movieItem.title
        detailsImageView.image = #imageLiteral(resourceName: "icon_details")
        overviewTextView.text = movieItem.overview == "" ? "**No overview exists for this one**" : movieItem.overview
        languageLabel.text = movieItem.language
        releaseDateLabel.text = movieItem.releaseDate

        if let posterPath = movieItem.posterPath {
            ImageDownloadManager.shared.downloadImageForImageView(url: Config.getPosterURL(with: posterPath), imageView: movieImageView)
        }
    }

    private func configureUI() {
        backgroundColor = .paleGrey
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
        movieImageView.contentMode = .scaleToFill
        overviewTextView.isEditable = false

        contentView.add(subviews: movieImageView, movieTitleLabel, detailsImageView, overviewTextView, languageLabel, releaseDateLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        setImageConstraints()
        setTitleLabelConstraints()
        setDetailsImageViewConstraints()
        setOverviewLabelConstraints()
        setLanguageLabelConstraints()
        setReleaseDateLabelConstraints()
    }

    private func setImageConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 188).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
    }

    private func setTitleLabelConstraints() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: detailsImageView.leadingAnchor, constant: -20).isActive = true
    }

    private func setDetailsImageViewConstraints() {
        detailsImageView.translatesAutoresizingMaskIntoConstraints = false
        detailsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        detailsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        detailsImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        detailsImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setOverviewLabelConstraints() {
        overviewTextView.translatesAutoresizingMaskIntoConstraints = false
        overviewTextView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 5).isActive = true
        overviewTextView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
        overviewTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        overviewTextView.bottomAnchor.constraint(lessThanOrEqualTo: languageLabel.topAnchor, constant: -10).isActive = true
    }

    private func setLanguageLabelConstraints() {
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 10).isActive = true
        languageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }

    private func setReleaseDateLabelConstraints() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: overviewTextView.bottomAnchor, constant: 15).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        releaseDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        releaseDateLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

}

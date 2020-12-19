//
//  VideoCollectionViewCell.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    private var videoLabel = UnderlinedLabel(font: .systemFont(ofSize: 14), textColor: .systemBlue)
    private var videoIconImageView = UIImageView(contentMode: .scaleAspectFit)

    private var videoItem: Video?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with videoItem: Video) {
        self.videoItem = videoItem

        if let videoName = videoItem.name, let videoURL = videoItem.site {
            let attributedString = NSMutableAttributedString(string: videoName)
            attributedString.SetAsLink(textToFind: videoName, linkURL: videoURL)
            videoLabel.attributedText = attributedString
//            videoLabel.sizeToFit()
        }
        videoIconImageView.image = #imageLiteral(resourceName: "icon_play")
    }

    private func configureUI() {
        backgroundColor = .paleGrey
        contentView.add(subviews: videoLabel, videoIconImageView)
        setupConstraints()
    }

    private func setupConstraints() {
        setVideoLabelConstraints()
        setVideoIconImageViewConstraints()
    }

    private func setVideoLabelConstraints() {
        videoLabel.translatesAutoresizingMaskIntoConstraints = false
        videoLabel.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        videoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        videoLabel.trailingAnchor.constraint(equalTo: videoIconImageView.leadingAnchor, constant: -10).isActive = true
//        videoLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -24).isActive = true
    }

    private func setVideoIconImageViewConstraints() {
        videoIconImageView.translatesAutoresizingMaskIntoConstraints = false
        videoIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: -15).isActive = true
        videoIconImageView.leadingAnchor.constraint(equalTo: videoLabel.trailingAnchor, constant: 10).isActive = true
//        videoIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
//        videoIconImageView.trailingAnchor.constraint(equalTo: videoLabel.trailingAnchor, constant: -5).isActive = true
        videoIconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        videoIconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
}

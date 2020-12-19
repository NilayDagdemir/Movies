//
//  VideoCollectionViewCell.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

protocol VideoCollectionViewCellDelegate: AnyObject {
    func videoURLClicked(with url: String?)
}

class VideoCollectionViewCell: UICollectionViewCell {
    private weak var delegate: VideoCollectionViewCellDelegate?
    private var videoLabel = UnderlinedLabel(font: .systemFont(ofSize: 14), textColor: .systemBlue)
    private var videoURL: String?
    private var videoItem: Video?

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
            layoutAttributes.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 15)
            isHeightCalculated = true
        }
        return layoutAttributes
    }

    private func configureUI() {
        backgroundColor = .paleGrey
        videoLabel.lineBreakMode = .byTruncatingTail
        videoLabel.isUserInteractionEnabled = true
        contentView.add(subviews: videoLabel)
        addTapGestureRecognizer()
        setVideoLabelConstraints()
    }

    func setup(delegate: VideoCollectionViewCellDelegate, with videoItem: Video) {
        self.delegate = delegate
        self.videoItem = videoItem

        if let videoName = videoItem.name, let videoURLBase = videoItem.site, let videoKey = videoItem.key {
            videoURL = Constants.getVideoURL(from: videoURLBase, videoKey)
            let attributedString = NSMutableAttributedString(string: videoName)
            attributedString.setAsLink(textToFind: videoName, linkURL: videoURL ?? "")
            videoLabel.attributedText = attributedString
        }
    }

    private func addTapGestureRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        videoLabel.addGestureRecognizer(tapRecognizer)
    }

    @objc private func labelTapped() {
        delegate?.videoURLClicked(with: videoURL)
    }

    private func setVideoLabelConstraints() {
        videoLabel.translatesAutoresizingMaskIntoConstraints = false
        videoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        videoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        videoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        videoLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
}

//
//  VideoSectionHeaderCell.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class VideoSectionHeaderCell: UICollectionReusableView {
     var titleLabel: UILabel = {
         let label = UnderlinedLabel(font: .systemFont(ofSize: 18), textColor: .darkGray)

         return label
     }()

     override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)

        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

//
//  SectionHeaderCell.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class SectionHeaderCell: UICollectionViewCell {
     var titleLabel: UILabel = {
        let label = UnderlinedLabel(font: .systemFont(ofSize: 16), textColor: .darkGray)

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

    var isHeightCalculated: Bool = false
    // swiftlint:disable:next line_length
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        if !isHeightCalculated {
            setNeedsLayout()
            layoutIfNeeded()
            layoutAttributes.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
            isHeightCalculated = true
        }
        return layoutAttributes
    }

    func setup(with title: String) {
        titleLabel.text = title
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

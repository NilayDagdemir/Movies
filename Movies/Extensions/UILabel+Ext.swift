//
//  UILabel+Ext.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(font: UIFont,
                     textColor: UIColor = .black,
                     alignment: NSTextAlignment = .left) {
        self.init()

        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
        self.backgroundColor = .clear
        self.numberOfLines = 0
    }
}

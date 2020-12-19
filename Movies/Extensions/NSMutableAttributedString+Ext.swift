//
//  NSMutableAttributedString+Ext.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    public func setAsLink(textToFind: String, linkURL: String) {
        let foundRange = self.mutableString.range(of: textToFind)

        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
        }
    }
}

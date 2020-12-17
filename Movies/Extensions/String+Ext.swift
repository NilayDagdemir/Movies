//
//  String+Ext.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 17.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension String {
    func isValidURL() -> Bool {
        if let url = URL(string: self), UIApplication.shared.canOpenURL(url) {
            return true
        }
        return false
    }
}

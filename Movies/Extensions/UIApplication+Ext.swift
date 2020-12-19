//
//  UIApplication+Ext.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

extension UIApplication {
    func openUrl(_ urlLink: String) {
        if let url = URL(string: urlLink), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

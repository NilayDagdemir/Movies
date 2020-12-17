//
//  UIView+Ext.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 15.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//


import UIKit

extension UIView {

    func pinToEdges(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

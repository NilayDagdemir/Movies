//
//  LoadingManager.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 16.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class LoadingManager: NSObject {

    static let shared = LoadingManager()
    private var indicator = UIActivityIndicatorView()

    private override init() {
        super.init()
        setupLoadingIndicator()
    }

    func setupLoadingIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.whiteLarge
        if let topMostViewController = UIApplication.shared.keyWindow?.rootViewController {
            indicator.center = topMostViewController.view.center
            topMostViewController.view.addSubview(indicator)
        }
    }

    func showLoadingProgress() {
        indicator.startAnimating()
    }

    func hideLoadingProgress() {
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
    }
}

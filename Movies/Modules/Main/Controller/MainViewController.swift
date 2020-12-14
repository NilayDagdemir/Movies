//
//  MainViewController.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("here entered main view controller")

        initView()
        // Do any additional setup after loading the view.
    }

    private func initView() {
        view = MainView()
//        (view as! AllMoviesView).setTableViewDataSourceDelegate(dataSourceDelegate: self)
    }
}

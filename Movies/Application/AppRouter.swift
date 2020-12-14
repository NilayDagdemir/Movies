//
//  AppRouter.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 14.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

open class AppRouter {

    public static var shared = AppRouter()

    var window: UIWindow?

    func start() {
        let starterViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: starterViewController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
}

//
//  TabBarController.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 18.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

enum TabBarItem: Int {
    case movies, search

    var title: String {
        switch self {
        case .movies  : return "Movies"
        case .search    : return "Search"
        }
    }

    var icon: UIImage {
        switch self {
        case .movies: return #imageLiteral(resourceName: "icon_movies")
        case .search: return #imageLiteral(resourceName: "icon_search")
        }
    }

    var viewController: UIViewController {
        switch self {
        case .movies: return MainRouter.setupModule()
        case .search: return SearchRouter.setupModule()
        }
    }
}

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }

    private func configureTabBar() {
        let moviesController = UINavigationController(rootViewController: TabBarItem.movies.viewController)
        let searchController = UINavigationController(rootViewController: TabBarItem.search.viewController)

        moviesController.tabBarItem = UITabBarItem(title: TabBarItem.movies.title,
                                                   image: TabBarItem.movies.icon,
                                                   tag: TabBarItem.movies.rawValue)

        searchController.tabBarItem = UITabBarItem(title: TabBarItem.search.title,
                                                      image: TabBarItem.search.icon,
                                                      tag: TabBarItem.search.rawValue)

        viewControllers = [moviesController, searchController]
    }
}

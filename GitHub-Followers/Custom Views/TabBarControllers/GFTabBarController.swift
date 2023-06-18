//
//  GFTabBarController.swift
//  GitHub-Followers
//
//  Created by APPLE on 18/06/2023.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers                 = [createSearchNC(), createFavoriteNC()]
    }
    
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoriteNC() -> UINavigationController {
        let favoriteVC = FavoritesListVC()
        favoriteVC.title = "Favorite"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoriteVC)
    }    

}

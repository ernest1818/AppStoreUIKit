//
//  MyTabBarController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

/// ТабБарКонтроллер 
final class MainTabBarController: UITabBarController {
    
    private enum Constans {
        static let buyTitleText = "Купить"
        static let forYouTitleText = "Для вас"
        static let searchTitleText = "Поиск"
        static let trashTitleText = "Корзина"
        static let buyImageName = "laptopcomputer.and.iphone"
        static let forYouImageName = "person.circle"
        static let searchImageName = "magnifyingglass"
        static let bagImageName = "bag"
        static let darkColor = "darkgrayColor"
    }

    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        let buyVC = BayViewController()
        let searchVC = SearchViewController()
        let forYouVC = ForYouViewController()
        let trashVC = BasketViewController()
        let forYouNavigationVC = UINavigationController(rootViewController: forYouVC)
        let searchNavigationVC = UINavigationController(rootViewController: searchVC)
        
        buyVC.tabBarItem = UITabBarItem(title: Constans.buyTitleText,
                                        image: UIImage(systemName: Constans.buyImageName),
                                        tag: 0)
       
        forYouNavigationVC.tabBarItem = UITabBarItem(title: Constans.forYouTitleText,
                                                     image: UIImage(systemName: Constans.forYouImageName),
                                                     tag: 1)
        searchNavigationVC.tabBarItem = UITabBarItem(title: Constans.searchTitleText,
                                                     image: UIImage(systemName: Constans.searchImageName),
                                                     tag: 2)
        trashVC.tabBarItem = UITabBarItem(title: Constans.trashTitleText,
                                          image: UIImage(systemName: Constans.bagImageName),
                                          tag: 3)
        tabBar.backgroundColor = UIColor(named: Constans.darkColor)
        viewControllers = [buyVC, forYouNavigationVC, searchNavigationVC, trashVC]
    }
}

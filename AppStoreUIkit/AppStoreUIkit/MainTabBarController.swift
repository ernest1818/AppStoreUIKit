//
//  MyTabBarController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

/// ТабБарКонтроллер 
final class MainTabBarController: UITabBarController {

    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        let bayVC = BayViewController()
        let searchVC = SearchViewController()
        let forYouVC = ForYouViewController()
        let trashVC = BasketViewController()
        let forYouNavigationVC = UINavigationController(rootViewController: forYouVC)
        let searchNavigationVC = UINavigationController(rootViewController: searchVC)
        
        bayVC.tabBarItem = UITabBarItem(title: "Купить",
                                                     image: UIImage(systemName: "laptopcomputer.and.iphone"),
                                                     selectedImage: UIImage(systemName: "laptopcomputer.and.iphone"))
        forYouNavigationVC.tabBarItem = UITabBarItem(title: "Для вас",
                                                     image: UIImage(systemName: "person.circle"),
                                                     selectedImage: UIImage(systemName: "person.circle"))
        searchNavigationVC.tabBarItem = UITabBarItem(title: "Поиск",
                                                     image: UIImage(systemName: "magnifyingglass"),
                                                     selectedImage: UIImage(systemName: "magnifyingglass"))
        trashVC.tabBarItem = UITabBarItem(title: "Корзина",
                                          image: UIImage(systemName: "bag"),
                                          selectedImage: UIImage(systemName: "bag"))
        tabBar.backgroundColor = UIColor(named: "darkgrayColor")
        
        viewControllers = [bayVC, forYouNavigationVC, searchNavigationVC, trashVC]
    }
}

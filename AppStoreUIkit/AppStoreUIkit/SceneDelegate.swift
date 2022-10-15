//
//  SceneDelegate.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private enum Constants {
        static let userDefaultsObject = "Onboarding"
        static let userDefaultsKey = "key"
    }
    
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let applicationScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = applicationScene
        let defaults = UserDefaults.standard
        let pageViewController = PageViewController()
        let tabBarController = MainTabBarController()
        if defaults.string(forKey: Constants.userDefaultsKey) == Constants.userDefaultsObject {
            window?.rootViewController = tabBarController
        } else {
            window?.rootViewController = pageViewController
        }
        window?.makeKeyAndVisible()
    }
}

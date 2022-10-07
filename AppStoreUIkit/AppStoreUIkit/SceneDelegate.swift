//
//  SceneDelegate.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let applicationScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = applicationScene
        let tabBarController = MainTabBarController()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

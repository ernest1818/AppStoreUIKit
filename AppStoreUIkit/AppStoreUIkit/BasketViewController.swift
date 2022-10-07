//
//  BasketViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

/// Экран приложения в который складывается выбранная юзером будущая покупка
final class BasketViewController: UIViewController {

    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .black
    }
}

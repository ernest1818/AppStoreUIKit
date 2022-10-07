//
//  ProductViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

///  Экран продукта
final class ProductViewController: UIViewController {

    // MARK: - Visual Components
    private lazy var myImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 30, y: 150, width: 330, height: 150)
        myImageView.contentMode = .scaleAspectFit
        return myImageView
    }()
    
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 80, width: 370, height: 80)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Public properties
    var text: String = ""
    var myImageIn: String = ""
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .black
        myLabel.text = text
        myImageView.image = UIImage(named: myImageIn)
        view.addSubview(myImageView)
        view.addSubview(myLabel)
    }
}

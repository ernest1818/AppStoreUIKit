//
//  ProductViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

///  Экран продукта
final class ProductViewController: UIViewController {
    
    private enum Conctans {
        static let orderText = "Заказ сегодня в теченеии дня, дотавка:"
        static let addButtonText = "Добавить в корзину"
        static let compatibilityLabelText = "Совместимо с"
        static let macBookText = "MacBook Pro - Евгений"
        static let dateText = "Чт 25 Фев - Бесплатно"
        static let typeDeliveryText = "Варианты доставки для местоположения: 115533"
        static let darkColor = "darkgrayColor"
        static let whiteColor = "whiteButtonColor"
        static let blackColor = "blackButtonColor"
        static let blackColorTwo = "blackButtonColorTwo"
        static let checkmarkImageName = "checkmark.circle.fill"
        static let shippingboxImageName = "shippingbox"
        static let heartImageName = "heart"
        static let squareImageName = "square.and.arrow.up"
    }

    // MARK: - Visual Components
    private lazy var descriptionProductLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 110, width: 390, height: 30)
        label.textColor = .white
        label.text = discriptionText
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 140, width: 390, height: 20)
        label.textColor = .gray
        label.text = price
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var imagesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 180, width: Int(view.bounds.width), height: 245)
        scrollView.backgroundColor = .black
        scrollView.contentSize = .init(width: view.bounds.width * 3, height: 200)
        scrollView.indicatorStyle = .white
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var firstScrollingImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 70, y: 12.5, width: 250, height: 220)
        myImageView.contentMode = .scaleAspectFit
        return myImageView
    }()
    
    private lazy var secondScrollingImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 70 + 390, y: 0, width: 250, height: 245)
        myImageView.contentMode = .scaleAspectFit
        return myImageView
    }()
    
    private lazy var therdScrollingImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 70 + (390 * 2), y: 0, width: 250, height: 245)
        myImageView.contentMode = .scaleAspectFit
        return myImageView
    }()
    
    private lazy var descriptionProductSmallLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 438, width: 390, height: 30)
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.text = discriptionText
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var whiteColorButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 155, y: 515, width: 35, height: 35)
        button.layer.cornerRadius = 17.5
        button.backgroundColor = UIColor(named: Conctans.whiteColor)
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var grayColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 200, y: 515, width: 32, height: 32)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var borderView: UIView = {
       let borderView = UIView()
        borderView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        borderView.center = grayColorButton.center
        borderView.backgroundColor = .black
        borderView.layer.cornerRadius = 20
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.tintColor.cgColor
        return borderView
    }()
    
    private lazy var addToBusketButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 10, y: 632, width: 370, height: 38)
        button.layer.cornerRadius = 9
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.setTitle(Conctans.addButtonText, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var compatibilityLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 575, width: 172, height: 30)
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        label.text = Conctans.compatibilityLabelText
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    private lazy var macBookProLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 174, y: 575, width: 172, height: 30)
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        label.text = Conctans.macBookText
        label.textColor = .tintColor
        label.textAlignment = .left
        return label
    }()
    
    private lazy var checkMarkImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 60, y: 580, width: 18, height: 18)
        myImageView.image = UIImage(systemName: Conctans.checkmarkImageName)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tintColor = .green
        return myImageView
    }()
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 60, y: 705, width: 300, height: 15)
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        label.text = Conctans.orderText
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var dateDeliveryLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 60, y: 720, width: 300, height: 15)
        label.font = .systemFont(ofSize: 11, weight: .semibold)
        label.text = Conctans.dateText
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private lazy var typeOfDevileryLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 60, y: 735, width: 300, height: 15)
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.text = Conctans.typeDeliveryText
        label.textColor = .tintColor
        label.textAlignment = .left
        return label
    }()
    
    private lazy var shippingBoxImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 20, y: 705, width: 18, height: 18)
        myImageView.image = UIImage(systemName: Conctans.shippingboxImageName)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tintColor = .systemGray2
        return myImageView
    }()

    // MARK: - Public properties
    var discriptionText = ""
    var firstImageName = ""
    var secondImageName = ""
    var therdImageName = ""
    var price = ""
    var tag = 0
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let apperiance = UINavigationBarAppearance()
        apperiance.configureWithOpaqueBackground()
        apperiance.backgroundColor = .red
        navigationController?.navigationBar.standardAppearance = apperiance
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(priceLabel)
        view.addSubview(imagesScrollView)
        
        imagesScrollView.addSubview(firstScrollingImageView)
        imagesScrollView.addSubview(secondScrollingImageView)
        imagesScrollView.addSubview(therdScrollingImageView)
        
        view.addSubview(descriptionProductLabel)
        view.addSubview(descriptionProductSmallLabel)
        
        view.addSubview(whiteColorButton)
        view.addSubview(borderView)
        view.addSubview(grayColorButton)
        
        view.addSubview(addToBusketButton)
        
        view.addSubview(compatibilityLabel)
        view.addSubview(macBookProLabel)
        view.addSubview(checkMarkImageView)
        
        view.addSubview(orderLabel)
        view.addSubview(dateDeliveryLabel)
        view.addSubview(typeOfDevileryLabel)
        
        view.addSubview(shippingBoxImageView)
        setUpNavigationBar()
        setupImages()
        setupScrollViewConfig()
        setupGradientColorButton()
    }
    
    private func setupImages() {
        firstScrollingImageView.image = UIImage(named: firstImageName)
        secondScrollingImageView.image = UIImage(named: secondImageName)
        therdScrollingImageView.image = UIImage(named: therdImageName)
    }
    
    private func setupScrollViewConfig() {
        if tag == 2 {
            imagesScrollView.contentSize = .init(width: view.bounds.width * 2, height: 200)
        }
    }
    
    private func setupGradientColorButton() {
        let gradientColor = CAGradientLayer()
        guard let firstColor = UIColor(named: Conctans.blackColor)?.cgColor,
              let secondColor = UIColor(named: Conctans.blackColorTwo)?.cgColor else { return }
        gradientColor.colors = [firstColor, secondColor]
        gradientColor.frame = grayColorButton.bounds
        grayColorButton.layer.insertSublayer(gradientColor, at: 0)
    }
    
    private func setUpNavigationBar() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: Conctans.heartImageName)),
            UIBarButtonItem(image: UIImage(systemName: Conctans.squareImageName))]
    }
}

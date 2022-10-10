//
//  SearchViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

/// Экран приложения позволяющий искать нужный товар 
final class SearchViewController: UIViewController {
    
    private enum Constans {
        static let searchBarPlaceholder = "Поиск по продуктам и магазинам"
        static let viewedLabelText = "Недавно просмотренные"
        static let requestsLabelText = "Варианты запросов"
        static let airPodsLabelText = "AirPods"
        static let appleCarsLabelText = "AppleCars"
        static let beatsLabelText = "Beats"
        static let iphoneLabelText = "Сравние модели iPhone"
        static let blackCaseText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let whatchText = "Спортивный ремещок Black Unity (для к..."
        static let brownCaseText = "Кожанный чехол для MacBook Pro 16 дюймов зол"
        static let iphoneText = "iphone 14 Pro Deep Purple"
        static let firstImageNameOne = "1"
        static let firstImageNameTwo = "blackCase2"
        static let firstImageNameThree = "blackCase3"
        static let therdImageNameOne = "3"
        static let therdImageNameTwo = "caseBrown2"
        static let therdImageNameThree = "caseBrown3"
        static let secondImageNameOne = "2"
        static let secondImageNameTwo = "clock2"
        static let iphoneImageName = "iphone"
        static let iphoneImageNameOne = "iphone1"
        static let iphoneImageNameTwo = "iphone2"
        static let darkColor = "darkgrayColor"
        static let samyColor = "samygrayColor"
        static let blackCasePrice = "3990.00 руб."
        static let whatchPrice = "1440.00 руб."
        static let brownCasePrice = "6599.00 руб."
        static let iphonePrice = "99 999.00 руб."
    }
    
    // MARK: - Visual Components
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 10, y: 145, width: 370, height: 30)
        searchBar.placeholder = Constans.searchBarPlaceholder
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        searchBar.barTintColor = .black
        searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        return searchBar
    }()
    
    private lazy var viewedLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 200, width: 300, height: 60)
        label.textColor = .white
        label.text = Constans.viewedLabelText
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var clearButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 300, y: 202, width: 100, height: 60)
        button.setTitle("Очистить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = .black
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 255, width: Int(view.bounds.width), height: 245)
        scrollView.backgroundColor = .black
        scrollView.contentSize = .init(width: 620, height: 180)
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var blackBagView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var whatchView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 160, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var brownBagView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 310, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var iphoneProView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 460, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var requestsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 455, width: 300, height: 60)
        label.textColor = .white
        label.text = Constans.requestsLabelText
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var airPodsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 505, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.airPodsLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var appleCarsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 555, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.appleCarsLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var beatsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 605, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.beatsLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var iphoneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 655, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.iphoneLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var firstLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 555, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var secondLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 605, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var therdLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 655, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var fourthLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 705, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var oneGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 520, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var twoGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 570, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var threeGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 620, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var fourGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 670, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var blackCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.firstImageNameOne)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 1
        return myImageView
    }()
    
    private lazy var whatchCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.secondImageNameOne)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 2
        return myImageView
    }()
    
    private lazy var brownCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.therdImageNameOne)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 3
        return myImageView
    }()
    
    private lazy var iphoneImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.iphoneImageName)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 3
        return myImageView
    }()
    
    private lazy var blackCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 105, width: 120, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.blackCaseText
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var whatchCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 105, width: 110, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.whatchText
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var brownCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 105, width: 120, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.brownCaseText
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private lazy var iphoneProLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 105, width: 120, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.iphoneText
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        setupViews()
        addRecognaizers()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Поиск"
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(searchBar)
        view.addSubview(viewedLabel)
        view.addSubview(clearButton)
        view.addSubview(myScrollView)
        
        myScrollView.addSubview(blackBagView)
        myScrollView.addSubview(whatchView)
        myScrollView.addSubview(brownBagView)
        myScrollView.addSubview(iphoneProView)
        
        view.addSubview(requestsLabel)
        
        view.addSubview(airPodsLabel)
        view.addSubview(appleCarsLabel)
        view.addSubview(beatsLabel)
        view.addSubview(iphoneLabel)
        
        view.addSubview(firstLineView)
        view.addSubview(secondLineView)
        view.addSubview(therdLineView)
        view.addSubview(fourthLineView)
        
        view.addSubview(oneGlassImageView)
        view.addSubview(twoGlassImageView)
        view.addSubview(threeGlassImageView)
        view.addSubview(fourGlassImageView)
        
        blackBagView.addSubview(blackCaseImageView)
        blackBagView.addSubview(blackCaseLabel)
        whatchView.addSubview(whatchCaseImageView)
        whatchView.addSubview(whatchCaseLabel)
        brownBagView.addSubview(brownCaseImageView)
        brownBagView.addSubview(brownCaseLabel)
        iphoneProView.addSubview(iphoneImageView)
        iphoneProView.addSubview(iphoneProLabel)
    }
    
    private func addRecognaizers() {
        blackBagView.tag = 1
        blackBagView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        blackBagView.isUserInteractionEnabled = true
        whatchView.tag = 2
        whatchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        whatchView.isUserInteractionEnabled = true
        brownBagView.tag = 3
        brownBagView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        brownBagView.isUserInteractionEnabled = true
        iphoneProView.tag = 4
        iphoneProView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        iphoneProView.isUserInteractionEnabled = true
    }
    
    @objc private func recognaizerAction(_ sender: UIGestureRecognizer) {
        let productVC = ProductViewController()
        let tag = sender.view?.tag
        switch tag {
        case 1:
            productVC.discriptionText = Constans.blackCaseText
            productVC.firstImageName = Constans.firstImageNameOne
            productVC.secondImageName = Constans.firstImageNameTwo
            productVC.therdImageName = Constans.firstImageNameThree
            productVC.price = Constans.blackCasePrice
        case 2:
            productVC.discriptionText = Constans.whatchText
            productVC.firstImageName = Constans.secondImageNameOne
            productVC.secondImageName = Constans.secondImageNameTwo
            productVC.price = Constans.whatchPrice
            productVC.tag = tag ?? 00
        case 3:
            productVC.discriptionText = Constans.brownCaseText
            productVC.firstImageName = Constans.therdImageNameOne
            productVC.secondImageName = Constans.therdImageNameTwo
            productVC.therdImageName = Constans.therdImageNameThree
            productVC.price = Constans.brownCasePrice
        case 4:
            productVC.discriptionText = Constans.iphoneText
            productVC.firstImageName = Constans.iphoneImageName
            productVC.secondImageName = Constans.iphoneImageNameOne
            productVC.therdImageName = Constans.iphoneImageNameTwo
            productVC.price = Constans.iphonePrice
        default:
            break
        }
        navigationController?.pushViewController(productVC, animated: true)
    }
}

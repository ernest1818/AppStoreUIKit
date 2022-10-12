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
        static let firstImageName = ["1", "blackCase2", "blackCase3"]
        static let therdImageName = ["3", "caseBrown2", "caseBrown3"]
        static let secondImageName = ["2", "clock2"]
        static let iphoneImageName = ["iphone", "iphone1", "iphone2"]
        static let darkColor = "darkgrayColor"
        static let samyColor = "samygrayColor"
        static let blackCasePrice = "3990.00 руб."
        static let whatchPrice = "1440.00 руб."
        static let brownCasePrice = "6599.00 руб."
        static let iphonePrice = "99 999.00 руб."
        static let searchText = "Поиск"
        static let glassImageName = "magnifyingglass"
    }
    
    // MARK: - Visual Components
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 10, y: 145, width: 370, height: 30)
        searchBar.placeholder = Constans.searchBarPlaceholder
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        searchBar.barTintColor = .black
        searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        return searchBar
    }()
    
    private let viewedLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 200, width: 300, height: 60)
        label.textColor = .white
        label.text = Constans.viewedLabelText
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let clearButton: UIButton = {
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
    
    private let blackBagView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let whatchView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 160, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private let brownBagView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 310, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iphoneProView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 460, y: 0, width: 140, height: 180)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let requestsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 455, width: 300, height: 60)
        label.textColor = .white
        label.text = Constans.requestsLabelText
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let airPodsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 505, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.airPodsLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private let appleCarsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 555, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.appleCarsLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private let beatsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 605, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.beatsLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private let iphoneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 655, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.iphoneLabelText
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private let blackCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.firstImageName.first ?? "")
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 1
        return myImageView
    }()
    
    private let whatchCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.secondImageName.first ?? "")
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 2
        return myImageView
    }()
    
    private let brownCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.therdImageName.first ?? "")
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 3
        return myImageView
    }()
    
    private let iphoneImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 27.5, y: 20, width: 85, height: 85)
        myImageView.image = UIImage(named: Constans.iphoneImageName.first ?? "")
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 3
        return myImageView
    }()
    
    private let blackCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 105, width: 120, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.blackCaseText
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let whatchCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 105, width: 110, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.whatchText
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let brownCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 105, width: 120, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.brownCaseText
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let iphoneProLabel: UILabel = {
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
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constans.searchText
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
        
        blackBagView.addSubview(blackCaseImageView)
        blackBagView.addSubview(blackCaseLabel)
        whatchView.addSubview(whatchCaseImageView)
        whatchView.addSubview(whatchCaseLabel)
        brownBagView.addSubview(brownCaseImageView)
        brownBagView.addSubview(brownCaseLabel)
        iphoneProView.addSubview(iphoneImageView)
        iphoneProView.addSubview(iphoneProLabel)
        
        createGlassImageViews()
        createLineViews()
    }
    
    private func createGlassImageViews() {
        view.addSubview(createGlassImageViews(coordinateY: 520))
        view.addSubview(createGlassImageViews(coordinateY: 570))
        view.addSubview(createGlassImageViews(coordinateY: 620))
        view.addSubview(createGlassImageViews(coordinateY: 670))
    }
    
    private func createLineViews() {
        view.addSubview(createLineView(coordinateY: 555))
        view.addSubview(createLineView(coordinateY: 605))
        view.addSubview(createLineView(coordinateY: 655))
        view.addSubview(createLineView(coordinateY: 705))
    }
    
    private func addRecognaizers() {
        blackBagView.tag = 0
        blackBagView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        blackBagView.isUserInteractionEnabled = true
        whatchView.tag = 1
        whatchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        whatchView.isUserInteractionEnabled = true
        brownBagView.tag = 2
        brownBagView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        brownBagView.isUserInteractionEnabled = true
        iphoneProView.tag = 3
        iphoneProView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recognaizerAction)))
        iphoneProView.isUserInteractionEnabled = true
    }
    
    @objc private func recognaizerAction(_ sender: UIGestureRecognizer) {
        let productVC = ProductViewController()
        let items = [(name: Constans.blackCaseText,
                      imageName: Constans.firstImageName,
                      prices: Constans.blackCasePrice,
                      tags: blackBagView.tag),
                     (name: Constans.whatchText,
                      imageName: Constans.secondImageName,
                      prices: Constans.whatchPrice,
                      tags: whatchView.tag),
                     (name: Constans.brownCaseText,
                      imageName: Constans.therdImageName,
                      prices: Constans.brownCasePrice,
                      tags: brownBagView.tag),
                     (name: Constans.iphoneText,
                      imageName: Constans.iphoneImageName,
                      prices: Constans.iphonePrice,
                      tags: iphoneProView.tag)]
        
        let item = items[sender.view?.tag ?? 0]
        productVC.product = item
        navigationController?.pushViewController(productVC, animated: true)
    }
}

extension UIViewController {
    func createGlassImageViews(coordinateY: CGFloat) -> UIImageView {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: coordinateY, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }
    
    func createLineView(coordinateY: CGFloat) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 30, y: coordinateY, width: 350, height: 1)
        view.backgroundColor = UIColor(named: "darkgrayColor")
        return view
    }
}

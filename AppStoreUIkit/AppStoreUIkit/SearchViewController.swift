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
        static let search = "Поиск"
        static let searchBarPlaceholder = "Поиск по продуктам и магазинам"
        static let viewedLabelText = "Недавно просмотренные"
        static let requestsLabelText = "Варианты запросов"
        static let airPodsLabel = "AirPods"
        static let appleCarsLabel = "AppleCars"
        static let beatsLabel = "Beats"
        static let iphoneLabel = "Сравние модели iPhone"
        static let blackCaseText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let whatchText = "Спортивный ремещок Black Unity (для к..."
        static let brownCaseText = "Кожанный чехол для MacBook Pro 16 дюймов зол"
        static let oneImageName = "1"
        static let twoImageName = "2"
        static let threeImageName = "3"
        static let darkColor = "darkgrayColor"
        static let samyColor = "samygrayColor"
    }
    
    // MARK: - Visual Components
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 80, width: 200, height: 60)
        label.textColor = .white
        label.text = Constans.search
        label.font = .systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    
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
        label.frame = CGRect(x: 10, y: 205, width: 300, height: 60)
        label.textColor = .white
        label.text = Constans.viewedLabelText
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var clearButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 300, y: 207, width: 100, height: 60)
        button.setTitle("Очистить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = .black
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var blackBagView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 10, y: 270, width: 140, height: 200)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var whatchView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 160, y: 270, width: 140, height: 200)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var brownBagView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 310, y: 270, width: 140, height: 200)
        view.backgroundColor = UIColor(named: Constans.samyColor)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var requestsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 500, width: 300, height: 60)
        label.textColor = .white
        label.text = Constans.requestsLabelText
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var airPodsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 550, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.airPodsLabel
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var appleCarsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.appleCarsLabel
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var beatsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 650, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.beatsLabel
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var iphoneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        label.textColor = .white
        label.text = Constans.iphoneLabel
        label.font = .systemFont(ofSize: 21, weight: .regular)
        return label
    }()
    
    private lazy var firstLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 600, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var secondLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 650, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var therdLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 700, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var fourthLineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 30, y: 750, width: 350, height: 1)
        view.backgroundColor = UIColor(named: Constans.darkColor)
        return view
    }()
    
    private lazy var oneGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 565, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var twoGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 615, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var threeGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 665, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var fourGlassImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 17, y: 715, width: 20, height: 20)
        myImageView.tintColor = .darkGray
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = UIImage(systemName: "magnifyingglass")
        return myImageView
    }()
    
    private lazy var blackCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 10, y: 20, width: 120, height: 100)
        myImageView.image = UIImage(named: Constans.oneImageName)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 1
        return myImageView
    }()
    
    private lazy var whatchCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 10, y: 20, width: 120, height: 100)
        myImageView.image = UIImage(named: Constans.twoImageName)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 2
        return myImageView
    }()
    
    private lazy var brownCaseImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.frame = CGRect(x: 10, y: 20, width: 120, height: 100)
        myImageView.image = UIImage(named: Constans.threeImageName)
        myImageView.contentMode = .scaleAspectFit
        myImageView.tag = 3
        return myImageView
    }()
    
    private lazy var blackCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 120, width: 120, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.blackCaseText
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private lazy var whatchCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 120, width: 110, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.whatchText
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private lazy var brownCaseLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 120, width: 120, height: 80)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = Constans.brownCaseText
        label.font = .systemFont(ofSize: 13, weight: .bold)
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
        view.backgroundColor = .black
    }
    
    private func setupViews() {
        view.addSubview(searchLabel)
        view.addSubview(searchBar)
        view.addSubview(viewedLabel)
        view.addSubview(clearButton)
        view.addSubview(blackBagView)
        view.addSubview(whatchView)
        view.addSubview(brownBagView)
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
    }
    
    @objc private func recognaizerAction(_ sender: UIGestureRecognizer) {
        let productVC = ProductViewController()
        let tag = sender.view?.tag
        switch tag {
        case 1:
            productVC.text = Constans.blackCaseText
            productVC.myImageIn = Constans.oneImageName
        case 2:
            productVC.text = Constans.whatchText
            productVC.myImageIn = Constans.twoImageName
        case 3:
            productVC.text = Constans.brownCaseText
            productVC.myImageIn = Constans.threeImageName
        default:
            break
        }
        navigationController?.pushViewController(productVC, animated: true)
    }
}

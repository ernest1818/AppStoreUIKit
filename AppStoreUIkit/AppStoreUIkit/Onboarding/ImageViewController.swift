//
//  ImageViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 13.10.2022.
//

import UIKit

// Класс отображающий страницы в PageViewController
final class ImageViewController: UIViewController {
    
    private enum Constants {
        static let firstLargeText = "Track Your Cicle"
        static let secondLargeText = "Plan Your Pregnancy"
        static let therdLargeText = "Daily Health Insighn"
        static let firstSmallText = "Manage irregular period and learn how to improve your period"
        static let secondSmallText = "Favorable days are impornant. Vestibulum rutrum quam vitae fringilla tincidunt"
        static let therdSmallText = "Personal health insight. Vestibulum rutrum quam vitae fringilla tincidunt"
        static let firstImageName = "page1"
        static let secondImageName = "page2"
        static let therdImageName = "page3"
    }
    
    // MARK: - Visual Components
    private var myImageView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 0, y: 50, width: 393, height: 500)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var largeFontLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 550, width: 330, height: 50)
        label.textColor = .black
        label.textAlignment = .center
        label.isHidden = false
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var smallFontLabel: UILabel = {
        let labelTwo = UILabel()
        labelTwo.frame = CGRect(x: 40, y: 580, width: 310, height: 70)
        labelTwo.textColor = .gray
        labelTwo.textAlignment = .center
        labelTwo.font = .systemFont(ofSize: 12, weight: .light)
        labelTwo.numberOfLines = 0
        return labelTwo
    }()

    // MARK: - Private Properties
    private var index = 0
    private var images: [Helper] = [Helper]()
    private lazy var subView = [myImageView, largeFontLabel, smallFontLabel]
    
    // MARK: - lifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAlphaAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setAlphaZero()
    }
    
    // MARK: - Public methods
    static func getInstance(index: Int) -> ImageViewController {
        let vc = ImageViewController()
        vc.index = index
        return vc
    }
    
    // MARK: - Pivate Methods
    private func setupUI() {
        view.backgroundColor = .white
        
        for view in subView {
            self.view.addSubview(view)
        }
        setAlphaZero()
        createPagesOnController()
        createViewValue()
    }
    
    private func createViewValue() {
        myImageView.image = UIImage(named: images[index].imageName)
        largeFontLabel.text = images[index].labelText
        smallFontLabel.text = images[index].secondLabelText
    }
    
    private func setAlphaAnimation() {
        UILabel.animate(withDuration: 1) {
            self.largeFontLabel.alpha = 1
            self.smallFontLabel.alpha = 1
        }
    }
    
    private func setAlphaZero() {
        largeFontLabel.alpha = 0
        largeFontLabel.alpha = 0
    }
    
    private func createPagesOnController() {
        let firstPage = Helper(labelText: Constants.firstLargeText,
                               secondLabelText: Constants.firstSmallText,
                               imageName: Constants.firstImageName)
        let secondPage = Helper(labelText: Constants.secondLargeText,
                               secondLabelText: Constants.secondSmallText,
                               imageName: Constants.secondImageName)
        let therdPage = Helper(labelText: Constants.therdLargeText,
                               secondLabelText: Constants.therdSmallText,
                               imageName: Constants.therdImageName)

        images.append(firstPage)
        images.append(secondPage)
        images.append(therdPage)
    }
}

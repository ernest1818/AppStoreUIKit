//
//  ForYouViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 06.10.2022.
//

import UIKit

/// Экран приложения отображающий информацию для юзера
final class ForYouViewController: UIViewController, UIScrollViewDelegate {

    private enum Constans {
        static let forYouTitleText = "Для вас"
        static let newLabelText = "Вот что нового"
        static let recomendText = "Рекомендуется вам"
        static let yourDeviceText = "ваши устройства"
        static let newsLabelText = "Получайте новости о своем заказе в режиме реального времени."
        static let notificationLabelText = "Включите уведомления, чтобы получать новости о своем заказе."
        static let processedText = ["Обрабатывается", "Отправлено", "Доставлено"]
        static let sendText = "Отправлено"
        static let deliveredText = "Доставлено"
        static let orderText = "Ваш заказ отправлен."
        static let descriptionText = "1 товар, доставка завтра"
        static let buttonTitleText = "Показать все"
        static let addBadgeImage = "app.badge"
        static let airPodsImage = "airPods"
        static let chevronImage = "chevron.right"
        static let whiteBarColor = "whiteBarColor"
        static let darkColor = "darkgrayColor"
        static let lineColor = "Color"
    }
    
    // MARK: - Visual Components
    private lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 20, width: view.bounds.width, height: 30)
        label.text = Constans.newLabelText
        label.textColor = .black
        label.font = .systemFont(ofSize: 27, weight: .bold)
        return label
    }()
    
    private lazy var myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height)
        scrollView.backgroundColor = .white
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height + 100)
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var continerView: UIView = {
        let myView = UIView()
        myView.frame = CGRect(x: 15, y: 90, width: 360, height: 160)
        myView.backgroundColor = .white
        myView.layer.cornerRadius = 15
        myView.layer.shadowColor = UIColor.gray.cgColor
        myView.layer.shadowRadius = 10
        myView.layer.shadowOffset = .init(width: 2, height: 2)
        myView.layer.shadowOpacity = 0.6
        return myView
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 15, y: 20, width: 60, height: 60)
        imageView.image = UIImage(named: Constans.airPodsImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 90, y: 18, width: 250, height: 30)
        label.text = Constans.orderText
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var deliveredLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 90, y: 43, width: 250, height: 30)
        label.text = Constans.descriptionText
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var reccomendYouLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 330, width: view.bounds.width, height: 30)
        label.text = Constans.recomendText
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var yourDeviceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 555, width: 300, height: 30)
        label.text = Constans.yourDeviceText
        label.textColor = .black
        label.font = .systemFont(ofSize: 27, weight: .bold)
        return label
    }()
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 105, y: 385, width: 220, height: 70)
        label.text = Constans.newsLabelText
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 105, y: 430, width: 270, height: 70)
        label.text = Constans.notificationLabelText
        label.textColor = .lightGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 25, y: 390, width: 45, height: 45)
        imageView.image = UIImage(systemName: Constans.addBadgeImage)
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var showButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 270, y: 559, width: 110, height: 30)
        button.setTitle(Constans.buttonTitleText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    
    private lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 365, y: 430, width: 15, height: 15)
        imageView.image = UIImage(systemName: Constans.chevronImage)
        imageView.tintColor = .systemGray3
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 15, y: 500, width: 390, height: 1)
        view.backgroundColor = UIColor(named: Constans.lineColor)
        return view
    }()
    
    private lazy var lineForContainerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 95, width: 360, height: 1)
        view.backgroundColor = UIColor(named: Constans.lineColor)
        return view
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.frame = CGRect(x: 10, y: 115, width: 340, height: 0)
        progressView.progressViewStyle = .default
        progressView.setProgress(0.5, animated: false)
        progressView.progressTintColor = .systemGreen
        progressView.layer.transform = CATransform3DMakeScale(1, 1.7, 0)
        return progressView
    }()
    
    private lazy var seporatorTitleView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 15, y: 0, width: 360, height: 1)
        view.backgroundColor = UIColor(named: Constans.lineColor)
        return view
    }()
    
    private lazy var avatarImageView: UIButton = {
        let rightButton = UIButton()
        rightButton.addTarget(self, action: #selector(showPickerController), for: .touchUpInside)
        rightButton.tag = 1
        rightButton.frame = CGRect(x: self.view.frame.width, y: 0, width: 40, height: 40)
        rightButton.layer.cornerRadius = 20
        rightButton.layer.masksToBounds = true
        return rightButton
    }()
    
    private lazy var emptyImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect(x: 315, y: 85, width: 50, height: 50)
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lightMode()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        darkMode()
    }
    
    // MARK: - Private methods
    private func lightMode() {
        tabBarController?.overrideUserInterfaceStyle = .light
        overrideUserInterfaceStyle = .light
    }
    
    private func darkMode() {
        tabBarController?.overrideUserInterfaceStyle = .unspecified
        overrideUserInterfaceStyle = .unspecified
    }
    
    private func setupUI() {
        view.addSubview(myScrollView)
        myScrollView.addSubview(whatsNewLabel)
        myScrollView.addSubview(reccomendYouLabel)
        myScrollView.addSubview(yourDeviceLabel)
        myScrollView.addSubview(newsLabel)
        myScrollView.addSubview(badgeImageView)
        myScrollView.addSubview(notificationLabel)
        myScrollView.addSubview(showButton)
        myScrollView.addSubview(chevronImageView)
        myScrollView.addSubview(lineView)
        myScrollView.addSubview(continerView)
        myScrollView.addSubview(seporatorTitleView)
        
        continerView.addSubview(lineForContainerView)
        continerView.addSubview(deliveredLabel)
        continerView.addSubview(orderLabel)
        continerView.addSubview(productImageView)
        continerView.addSubview(progressView)
        addLabelsOnCintainerView()
        setNavigationConfiguration()
        checkImageView()
    }
    
    private func addLabelsOnCintainerView() {
        var numberX: CGFloat = 10
        for index in Constans.processedText {
           let firstLabel = createLabels(numberX: numberX, text: index)
            continerView.addSubview(firstLabel)
            numberX += 133
        }
    }
    
    private func setNavigationConfiguration() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                            UIColor.black]
        
        let steckView = UIStackView(arrangedSubviews: [emptyImageView, avatarImageView ])
        steckView.axis = .horizontal
        steckView.frame.size = CGSize(width: avatarImageView.frame.size.width,
                                      height: avatarImageView.frame.size.height + emptyImageView.frame.size.height)
        steckView.spacing = 300
        title = Constans.forYouTitleText
         navigationItem.rightBarButtonItem = UIBarButtonItem(customView: steckView)
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                    action: #selector(showPickerController)))
        view.backgroundColor = .white
       
    }
    
    private func setUserDefaultsImage(image: Data) {
        let defaults = UserDefaults.standard
        defaults.setValue(image, forKey: "imageData")
       
    }
    
    private func checkImageView() {
        let defaults = UserDefaults.standard
        guard let image = defaults.data(forKey: "imageData") else { return }
        avatarImageView.setImage(UIImage(data: image), for: .normal)
    }
    
    private func createImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }

    @objc private func showPickerController() {
        createImagePicker()
    }
}

extension UIViewController {
    func createLabels(numberX: CGFloat, text: String?) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: numberX, y: 130, width: 120, height: 15)
        label.text = text
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }
}

// MARK: - UIImagePickerControllerDelegate
extension ForYouViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        else { return }
        avatarImageView.setImage(image, for: .normal)
        guard let imageData = image.pngData() else { return }
        setUserDefaultsImage(image: imageData)
        dismiss(animated: true)
    }
}

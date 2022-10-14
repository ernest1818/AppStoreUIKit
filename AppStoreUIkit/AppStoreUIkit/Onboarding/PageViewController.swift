//
//  PageViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 13.10.2022.
//

import UIKit

/// Экран карусели перед входм в приложение
final class PageViewController: UIPageViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let userDefaultsKey = "key"
        static let startedButtonTitle = "GET STARTED !"
        static let nextButtonTitle = "NEXT"
        static let skipButtonTitle = "SKIP"
        static let onboardingText = "Onboarding"
    }
    
    // MARK: - Private Properties
    private let oneboardingKey = Constants.onboardingText
    private let getStartedButton = UIButton()
    private let pageControl = UIPageControl()
    private var index = 0
    private var skipButton = UIButton()
    private var nextButton = UIButton()
    private var imagePages: [UIViewController] = [UIViewController]()
    
    // MARK: - Initiazers
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        setViewsConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Pivate Methods
    private func setupUI() {
        createNextButton()
        createSkipButton()
        createPageControl()
        createStartButton()
    }
    
    private func setViewsConfiguration() {
        view.backgroundColor = .black
        dataSource = self
        delegate = self
        imagePages = [
            ImageViewController.getInstance(index: 0),
            ImageViewController.getInstance(index: 1),
            ImageViewController.getInstance(index: 2)
        ]
        setViewControllers([imagePages[0]], direction: .forward, animated: true, completion: nil)
    }
    
    private func createPageControl() {
        pageControl.frame = CGRect(x: 90, y: 780, width: 200, height: 50)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.addTarget(self, action: #selector(pageControlAction), for: .valueChanged)
        view.addSubview(pageControl)
    }
    
    private func createSkipButton() {
        skipButton.frame = CGRect(x: 55, y: 780, width: 70, height: 50)
        skipButton.setTitle(Constants.skipButtonTitle, for: .normal)
        skipButton.setTitleColor(UIColor.darkGray, for: .normal)
        skipButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        skipButton.addTarget(self, action: #selector(dissmissAction), for: .touchUpInside)
        view.addSubview(skipButton)
    }
    
    private func createNextButton() {
        nextButton.frame = CGRect(x: 270, y: 780, width: 70, height: 50)
        nextButton.setTitle(Constants.nextButtonTitle, for: .normal)
        nextButton.setTitleColor(UIColor.systemBlue, for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    private func createStartButton() {
        getStartedButton.frame = CGRect(x: 20, y: 730, width: 350, height: 60)
        getStartedButton.setTitle(Constants.startedButtonTitle, for: .normal)
        getStartedButton.setTitleColor(.systemBlue, for: .normal)
        getStartedButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        getStartedButton.addTarget(self, action: #selector(dissmissAction), for: .touchUpInside)
        getStartedButton.isHidden = true
        view.addSubview(getStartedButton)
    }
    
    private func createAnimationInScrollAfter() {
        if pageControl.currentPage == 2 {
            nextButton.isHidden = true
            pageControl.isHidden = true
            skipButton.isHidden = true
            getStartedButton.isHidden = true
            UIView.transition(with: getStartedButton,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.getStartedButton.isHidden = false })
            
            UIView.transition(with: skipButton,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.skipButton.isHidden = true })
            
            UIView.transition(with: pageControl,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.pageControl.isHidden = true })
            
            UIView.transition(with: nextButton,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.nextButton.isHidden = true })
        }
    }
    
    private func createAnimationInScrollBefore() {
        if pageControl.currentPage == 1 {
            nextButton.isHidden = false
            pageControl.isHidden = false
            skipButton.isHidden = false
            getStartedButton.isHidden = true
            UIView.transition(with: getStartedButton,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.getStartedButton.isHidden = true })
            
            UIView.transition(with: skipButton,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.skipButton.isHidden = false })
            
            UIView.transition(with: pageControl,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.pageControl.isHidden = false })
            
            UIView.transition(with: nextButton,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.nextButton.isHidden = false })
        }
    }
    
    private func createAnimationInButton() {
        if pageControl.currentPage == imagePages.endIndex - 1 {
            nextButton.isHidden = true
            skipButton.isHidden = true
            pageControl.isHidden = true
            UIView.transition(with: getStartedButton,
                              duration: 1,
                              options: .transitionCrossDissolve,
                              animations: { self.getStartedButton.isHidden = false })
        }
    }
    
    @objc private func dissmissAction() {
        let deafults = UserDefaults.standard
        deafults.set(oneboardingKey, forKey: Constants.userDefaultsKey)
        
        let tabBarVC = MainTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    @objc func pageControlAction(_ sender: UIPageControl) {
        setViewControllers([imagePages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func nextButtonAction(_ sender: UIButton) {
        pageControl.currentPage += 1
        goToNext(index: pageControl.currentPage, controller: imagePages)
    }
}

// MARK: - UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = imagePages.firstIndex(of: viewController) else { return nil }
        if currentIndex == 0 {
            return nil
        } else {
            return imagePages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = imagePages.firstIndex(of: viewController) else { return nil }
        if currentIndex == imagePages.count - 1 {
            return nil
        } else {
            return imagePages[currentIndex + 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard let index = pageViewController.viewControllers?[0],
              let currentIndex = imagePages.firstIndex(of: index) else { return }
        pageControl.currentPage = currentIndex
        createAnimationInScrollBefore()
        createAnimationInScrollAfter()
    }
}

// MARK: - метод перелистывания страницы вперед потнажатию на кнопку
extension PageViewController {
    func goToNext(index: Int, controller: [UIViewController]) {
        setViewControllers([controller[index]], direction: .forward, animated: true)
        createAnimationInButton()
    }
}

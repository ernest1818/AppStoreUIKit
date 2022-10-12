//
//  WebViewController.swift
//  AppStoreUIkit
//
//  Created by Ernest Avagovich on 10.10.2022.
//

import UIKit
import WebKit

/// Экран отображения страниц во всемирной поутине
final class WebViewController: UIViewController {
    
    private enum Constants {
        static let goBackItem = "chevron.left"
        static let goForvardItem = "chevron.right"
        static let refreshItem = "goforward"
        static let sharedItem = "square.and.arrow.up"
        static let urls = [
            "https://www.apple.com/shop/product/HLKY2ZM/A/incase-13-icon-sleeve-with-woolenex-for-macbook-air-and-macbook-pro?fnode=285eae0bf10ed862ac6c7ea26ed75bb22efe24e7c170b11a562aeb225166dc5bc951d82c734825dec8a26e425feba2c58c859bdf7c8ac7171d90a6b7f5c4e715063cc738b1b0b1b29a03891adb0d4968694cad0af9c63f3a32bc2d038def77e9c9e7c69fdf2a8264c0e50a12546e061d",
            "https://www.apple.com/shop/product/MJ4V3AM/A/40mm-black-unity-sport-band-regular?fnode=33e7e2286239daabbb734d1fb56f75cc51419fd6f68f8afa4121ea5dac5db5648c6412601e5944a24c5aeb67d5dc1352860577692810fc1157d1ceca4c121e2b11ec8075f5acfff638099db43b707d1f",
            "https://www.apple.com/shop/product/HPZS2ZM/A/von-holzhausen-macbook-14-portfolio?fnode=285eae0bf10ed862ac6c7ea26ed75bb22efe24e7c170b11a562aeb225166dc5bc951d82c734825dec8a26e425feba2c58c859bdf7c8ac7171d90a6b7f5c4e715063cc738b1b0b1b29a03891adb0d4968694cad0af9c63f3a32bc2d038def77e9c9e7c69fdf2a8264c0e50a12546e061d",
            "https://www.apple.com/iphone/compare/"]
    }
    
    // MARK: - Private variables
    private var refreshItem = UIBarButtonItem()
    private var goBackItem = UIBarButtonItem()
    private var goForvardItem = UIBarButtonItem()
    private var spacer = UIBarButtonItem.flexibleSpace()
    private var smallspacer = UIBarButtonItem(systemItem: .fixedSpace)
    private var webView = WKWebView()
    private var sharedItem = UIBarButtonItem()
    private var backButton = UIBarButtonItem()
    private var progressItem = UIBarButtonItem()
    private var activityIndicatorContainer = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    private var myProgressView = UIProgressView(progressViewStyle: .default)
    private var observation: NSKeyValueObservation?
    
    // MARK: - Public variables
    var tag = 0
    var tagTwo: Int?
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createWebView()
        createUrl()
        createLowerToolBar()
        createUpperToolBar()
        createProgressView()
    }
    
    private func createWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .init(x: 0, y: 80, width: view.bounds.width, height: 700),
                            configuration: webConfiguration)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
    }
    
    private func createUrl() {
        
        guard var url = URL(string: Constants.urls[tag]),
              let pdfUrl = Bundle.main.url(forResource: "price", withExtension: "pdf") else { return }
        if tagTwo != nil {
            url = pdfUrl
        }
        
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
    }
    
    private func createActivityIndicator() {
        activityIndicatorContainer = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        activityIndicatorContainer.center.x = webView.center.x
        activityIndicatorContainer.center.y = webView.center.y - 43
        activityIndicatorContainer.backgroundColor = UIColor.black
        activityIndicatorContainer.alpha = 0.7
        activityIndicatorContainer.layer.cornerRadius = 15
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center.x = 40
        activityIndicator.center.y = 40
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicatorContainer.addSubview(activityIndicator)
        webView.addSubview(activityIndicatorContainer)
    }
    
    private func createLowerToolBar() {
        let screenWidth = view.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 770, width: screenWidth, height: 44))
        toolBar.backgroundColor = .clear
        goBackItem = UIBarButtonItem(image: UIImage(systemName: Constants.goBackItem),
                                     style: .plain,
                                     target: self,
                                     action: #selector(goBackAction))
        goForvardItem = UIBarButtonItem(image: UIImage(systemName: Constants.goForvardItem),
                                        style: .plain,
                                        target: self,
                                        action: #selector(goForwardAction))
        sharedItem = UIBarButtonItem(image: UIImage(systemName: Constants.sharedItem),
                                     style: .plain,
                                     target: self,
                                     action: #selector(sharedAction))
        smallspacer.width = 40
        progressItem = UIBarButtonItem(customView: myProgressView)
        toolBar.isTranslucent = false
        toolBar.items = [goBackItem, smallspacer, goForvardItem, progressItem, smallspacer, sharedItem]
        view.addSubview(toolBar)
    }
    
    private func createUpperToolBar() {
        let screenWidth = view.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 80))
        toolBar.isTranslucent = false
        refreshItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshAction))
        backButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        smallspacer.width = 60
        myProgressView.sizeToFit()
        
        toolBar.items = [backButton, spacer, smallspacer, refreshItem]
        view.addSubview(toolBar)
    }
    
    private func createProgressView() {
        myProgressView.setProgress(0.5, animated: false)
        observation = webView.observe(\.estimatedProgress, options: [.new]) { _, _ in
            self.myProgressView.progress = Float(self.webView.estimatedProgress)
            if self.myProgressView.progress == 1.0 {
                self.myProgressView.isHidden = true
            }
        }
    }
    
    @objc private func refreshAction() {
        webView.reload()
    }
    
    @objc private func goForwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
        
    }
    @objc private func goBackAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func sharedAction() {
        guard let url = webView.url else { return }
        let text = "\(url)"
        let activityViewControler = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityViewControler, animated: true)
    }
    
    private func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicatorContainer.isHidden = true
        }
    }
    
    @objc private func doneAction() {
        dismiss(animated: true)
    }
}

// MARK: - WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        createActivityIndicator()
        showActivityIndicator(show: true)
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}

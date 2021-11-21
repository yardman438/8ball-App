//
//  MainViewController.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.10.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit
import SnapKit

class BallViewController: UIViewController {
    
    private let answerLabel = UILabel()
    private let shakeButton = UIButton(type: .system)
    private let magicBallImage = UIImage(asset: Asset.predictBall)
    
    private var ballViewModel: BallViewModel
    
    init(viewModel: BallViewModel) {
        self.ballViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        ballViewModel.updateInterface { (answer) in
            DispatchQueue.main.async {
                self.answerLabel.text = answer
            }
        }
    }
    
    @objc private func shakeButtonPressed() {
        ballViewModel.updateInterface { (answer) in
            DispatchQueue.main.async {
                self.answerLabel.text = answer
            }
        }
    }
    
    @objc private func settingsButtonPressed() {
        let settingsScreenViewController = injectToSettingsScreenViewController()
        navigationController?.pushViewController(settingsScreenViewController, animated: true)
    }
}

// MARK: Extensions

extension BallViewController {
    
    // The main function to setup interface
    private func setupInterface() {
        view.backgroundColor = UIColor(asset: Asset.backgroundColor)
        
        setupNavigationBar()
        setupMagicBallImage()
        setupAnswerLabel()
        setupShakeButton()
    }
    
    // The function to setup the navigation bar
    private func setupNavigationBar() {
        self.title = L10n.title
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(asset: Asset.settings),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(settingsButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(asset: Asset.buttonColor)
    }
    
    // The function to setup the main label on the screen
    private func setupAnswerLabel() {
        answerLabel.text = L10n.bootQuestion
        answerLabel.textAlignment = .center
        answerLabel.textColor = UIColor(asset: Asset.textColor)
        answerLabel.font = UIFont.systemFont(ofSize: 36)
        answerLabel.numberOfLines = 0
        view.addSubview(answerLabel)
        answerLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.safeAreaLayoutGuide.snp.center)
            make.height.greaterThanOrEqualTo(50)
            make.width.lessThanOrEqualTo(265)
        }
    }
    
    // The function to setup the button for action
    private func setupShakeButton() {
        shakeButton.backgroundColor = UIColor(asset: Asset.buttonColor)
        shakeButton.layer.cornerRadius = 35
        shakeButton.setTitle(L10n.mainButtonCTA, for: .normal)
        shakeButton.setTitleColor(.white, for: .normal)
        shakeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        shakeButton.clipsToBounds = true
        view.addSubview(shakeButton)
        shakeButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(30)
            make.height.equalTo(70)
            make.width.equalTo(250)
        }
        shakeButton.addTarget(self, action: #selector(shakeButtonPressed), for: .touchUpInside)
    }
    
    // The function to setup the image on the background of the answerLabel
    private func setupMagicBallImage() {
        let imageView = UIImageView(image: magicBallImage)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.safeAreaLayoutGuide.snp.center)
            make.height.width.equalTo(430)
        }
    }
}

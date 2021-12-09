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
    
    private var isAnswerReady = false
    
    private let answerLabel = UILabel()
    private let shakeButton = UIButton(type: .system)
    
    private let triangleView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.triangle)
        return view
    }()
    let arcView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        return view
    }()
    
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
        ballViewModel.updateInterface { [weak self] (answer) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if answer != nil {
                    self.isAnswerReady = true
                }
                self.getAnswerAnimation()
                self.answerLabel.text = answer
            }
        }
    }
    
    @objc private func shakeButtonPressed() {
        ballViewModel.updateInterface { [weak self] (answer) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if answer != nil {
                    self.isAnswerReady = true
                }
                self.getAnswerAnimation()
                self.answerLabel.text = answer
            }
        }
    }
}

// MARK: Interface setup

extension BallViewController {
    
    // The main function to setup interface
    private func setupInterface() {
        view.backgroundColor = UIColor(asset: Asset.backgroundColor)
        
        setupNavigationBar()
        setupTriangleImage()
        setupArc()
        setupAnswerLabel()
        setupShakeButton()
    }
    
    // The function to setup the navigation bar
    private func setupNavigationBar() {
        let logo = UIImage(asset: Asset._8Ball)
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
    }
    
    // The function to setup the main label on the screen
    private func setupAnswerLabel() {
        answerLabel.text = L10n.bootQuestion
        answerLabel.textAlignment = .center
        answerLabel.textColor = UIColor(asset: Asset.secondaryColor)
        answerLabel.font = UIFont.systemFont(ofSize: 21)
        answerLabel.numberOfLines = 0
        view.addSubview(answerLabel)
        answerLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(260)
            make.height.greaterThanOrEqualTo(50)
            make.width.lessThanOrEqualTo(140)
        }
    }
    
    // The function to setup the CTA-button on the screen
    private func setupShakeButton() {
        shakeButton.setTitle(L10n.mainButtonCTA, for: .normal)
        shakeButton.setTitleColor(UIColor(asset: Asset.buttonColor), for: .normal)
        shakeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        shakeButton.clipsToBounds = true
        view.addSubview(shakeButton)
        shakeButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(30)
            make.height.equalTo(70)
            make.width.equalTo(210)
        }
        shakeButton.addTarget(self, action: #selector(shakeButtonPressed), for: .touchUpInside)
    }
    
    // The function to setup the image on the background of the answerLabel
    private func setupTriangleImage() {
        view.addSubview(triangleView)
        triangleView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.safeAreaLayoutGuide.snp.center)
            make.height.width.equalTo(240)
        }
    }
    
    // The function to setup the shape on the top of the screen
    private func setupArc() {
        view.addSubview(arcView)
        arcView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
        drawArc()
    }
}

// MARK: Creating shapes

extension BallViewController {
    
    private func drawArc() {
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
                                radius: 1,
                                startAngle: 0,
                                endAngle: .pi,
                                clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.strokeColor = UIColor(asset: Asset.secondaryColor)?.cgColor
        
        arcView.layer.addSublayer(shapeLayer)
    }
    
}

// MARK: Animations

extension BallViewController {
    
    private func getAnswerAnimation() {
        
        let options: UIView.AnimationOptions = [.curveEaseInOut]
        
        self.answerLabel.isHidden = true
        self.arcView.isHidden = false
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [.repeat, .autoreverse]) { [weak self] in
            guard let self = self else { return }
            self.arcView.transform = CGAffineTransform.init(scaleX: 10, y: 10)
        }
        
        UIView.animate(withDuration: 1.5, delay: 0, options: options) { [weak self] in
            guard let self = self else { return }
            self.triangleView.transform = CGAffineTransform.init(translationX: self.view.bounds.width, y: 0)
        } completion: { [weak self] _ in
            guard let self = self else { return }
            self.triangleView.transform = CGAffineTransform.init(translationX: -self.view.bounds.width, y: 0)
            UIView.animate(withDuration: 1.5, delay: 0, options: options) {
                self.triangleView.transform = CGAffineTransform.identity
            } completion: { _ in
                if self.isAnswerReady {
                    self.answerLabel.isHidden = false
                    self.arcView.isHidden = true
                } else {
                    self.getAnswerAnimation()
                }
            }
        }
    }
}

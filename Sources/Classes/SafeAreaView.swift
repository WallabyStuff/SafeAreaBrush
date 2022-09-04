//
//  SafeAreaView.swift
//  SafeAreaBrush
//
//  Created by WallabyStuff on 2022/06/22.
//

import UIKit

class SafeAreaView: UIView {
    
    
    // MARK: - Properties
    
    private var position: SafeAreaPosition
    private var parentView: UIView
    
    private var widthAnchorConstraint = NSLayoutConstraint()
    private var heightAnchorConstraint = NSLayoutConstraint()
    
    private var gradientLayer = CAGradientLayer()
    private var insertAt: Int
    
    
    // MARK: - LifeCycle
    
    init(position: SafeAreaPosition,
         parentView: UIView,
         insertAt: Int = -1) {
        self.position = position
        self.parentView = parentView
        self.insertAt = insertAt
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        setupView()
    }
    
    private func setupView() {
        setupSafeAreaView()
    }
    
    private func setupSafeAreaView() {
        setupSafeAreaViewTag()
        
        if insertAt == -1 {
            parentView.addSubview(self)
        } else {
            parentView.insertSubview(self, at: insertAt)
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        configureSafeAreaViewConstraints()
    }
    
    private func setupSafeAreaViewTag() {
        self.tag = position.tag
    }
    
    
    // MARK: - Constraints
    
    override var bounds: CGRect {
        didSet {
            /// Update constraints or frames here
            updateWidthConstraint()
            updateHeightConstraint()
            configureGradientLayerFrame()
        }
    }
    
    private func updateWidthConstraint() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if self.position == .right {
                self.widthAnchorConstraint.constant = self.parentView.safeAreaInsets.left
            } else if self.position == .left {
                self.widthAnchorConstraint.constant = self.parentView.safeAreaInsets.right
            }
            
            self.layoutIfNeeded()
        }
    }
    
    private func updateHeightConstraint() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if self.position == .top {
                self.heightAnchorConstraint.constant = self.parentView.safeAreaInsets.top
            } else if self.position == .bottom {
                self.heightAnchorConstraint.constant = self.parentView.safeAreaInsets.bottom
            }
            
            self.layoutIfNeeded()
        }
    }
    
    private func configureSafeAreaViewConstraints() {
        switch position {
        case .top:
            configureTopSafeAreaViewConstraints()
        case .left:
            configureLeftSafeAreaViewConstraints()
        case .right:
            configureRightSafeAreaViewConstraints()
        case .bottom:
            configureBottomSafeAreaViewConstraints()
        }
    }
    
    private func configureTopSafeAreaViewConstraints() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.heightAnchorConstraint = self.heightAnchor.constraint(equalToConstant: self.parentView.safeAreaInsets.top)
            
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: self.parentView.topAnchor),
                self.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor),
                self.heightAnchorConstraint,
            ])
        }
    }
    
    private func configureLeftSafeAreaViewConstraints() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.widthAnchorConstraint = self.widthAnchor.constraint(equalToConstant: self.parentView.safeAreaInsets.left)
            
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: self.parentView.topAnchor),
                self.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor),
                self.bottomAnchor.constraint(equalTo: self.parentView.bottomAnchor),
                self.widthAnchorConstraint,
            ])
        }
    }
    
    private func configureRightSafeAreaViewConstraints() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.widthAnchorConstraint = self.widthAnchor.constraint(equalToConstant: self.parentView.safeAreaInsets.left)
            
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: self.parentView.topAnchor),
                self.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor),
                self.bottomAnchor.constraint(equalTo: self.parentView.bottomAnchor),
                self.widthAnchorConstraint,
            ])
        }
    }
    
    private func configureBottomSafeAreaViewConstraints() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.heightAnchorConstraint = self.heightAnchor.constraint(equalToConstant: self.parentView.safeAreaInsets.bottom)
            
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor),
                self.bottomAnchor.constraint(equalTo: self.parentView.bottomAnchor),
                self.heightAnchorConstraint,
            ])
        }
    }
    
    private func configureGradientLayerFrame() {
        CALayer.performWithoutAnimation {
            self.gradientLayer.frame = self.bounds
        }
    }
    
    
    // MARK: - BlurEffect
    
  public func configureBlurEffectView(style: UIBlurEffect.Style,
                                        gradient: Bool) {
        let blurEffect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        
        addSubview(visualEffectView)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: topAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        if gradient == true {
            configureGradient()
        }
    }
    
    
    // MARK: - Gradient
    
    public func configureGradient() {
        let gradientColor = backgroundColor ?? .white
        gradientLayer.colors = [gradientColor.cgColor, gradientColor.withAlphaComponent(0.5).cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.3, 0.7]
        
        switch position {
        case .top:
            gradientLayer.startPoint = .init(x: 0.5, y: 0.0)
            gradientLayer.endPoint = .init(x: 0.5, y: 1.0)
        case .left:
            gradientLayer.startPoint = .init(x: 0.0, y: 0.5)
            gradientLayer.endPoint = .init(x: 1.0, y: 0.5)
        case .right:
            gradientLayer.startPoint = .init(x: 1.0, y: 0.5)
            gradientLayer.endPoint = .init(x: 0.0, y: 0.5)
        case .bottom:
            gradientLayer.startPoint = .init(x: 0.5, y: 1.0)
            gradientLayer.endPoint = .init(x: 0.5, y: 0.0)
        }
        
        self.layer.mask = gradientLayer
    }
}

//
//  UIViewController+SafeAreaBrush.swift
//  SafeAreaBrush
//
//  Created by WallabyStuff on 2022/06/22.
//

import UIKit

extension UIViewController {
    
    public func fillSafeArea(position: SafeAreaPosition,
                             color: UIColor,
                             gradient: Bool = false) {
        fillSafeArea(position: position,
                     color: color,
                     gradient: gradient,
                     insertAt: -1)
    }
    
    public func fillSafeArea(position: SafeAreaPosition,
                             color: UIColor,
                             gradient: Bool = false,
                             insertAt: Int) {
        let safeAreaView = SafeAreaView(position: position,
                                        parentView: view,
                                        insertAt: insertAt)
        safeAreaView.backgroundColor = color
        
        if gradient == true {
            safeAreaView.configureGradient()
        }
    }
    
    public func fillSafeArea(position: SafeAreaPosition,
                             blur: UIBlurEffect.Style,
                             gradient: Bool = false) {
        fillSafeArea(position: position,
                     blur: blur,
                     gradient: gradient,
                     insertAt: -1)
    }
    
    public func fillSafeArea(position: SafeAreaPosition,
                             blur: UIBlurEffect.Style,
                             gradient: Bool = false,
                             insertAt: Int) {
        let safeAreaView = SafeAreaView(position: position,
                                        parentView: view,
                                        insertAt: insertAt)
        safeAreaView.configureBlurEffectView(style: blur, gradient: gradient)
    }
    
    public func removeSafeArea(position: SafeAreaPosition) {
        if let viewWithTag = view.viewWithTag(position.tag) {
            viewWithTag.removeFromSuperview()
        }
    }
}

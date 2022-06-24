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
        let safeAreaView = SafeAreaView(position: position,
                                        parentView: view)
        safeAreaView.backgroundColor = color
        
        if gradient == true {
            safeAreaView.configureGradient()
        }
    }
    
    public func fillSafeArea(position: SafeAreaPosition,
                      blur: UIBlurEffect.Style,
                      gradient: Bool = false) {
        let safeAreaView = SafeAreaView(position: position,
                                        parentView: view)
        safeAreaView.configureBlurEffectView(style: blur, gradient: gradient)
    }
}

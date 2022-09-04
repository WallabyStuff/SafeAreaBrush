//
//  CALayer+Animation.swift
//  Pods
//
//  Created by 이승기 on 2022/06/24.
//

import UIKit

extension CALayer {
    class func performWithoutAnimation(_ actionsWithoutAnimation: () -> Void){
        CATransaction.begin()
        CATransaction.setValue(true, forKey: kCATransactionDisableActions)
        actionsWithoutAnimation()
        CATransaction.commit()
    }
}

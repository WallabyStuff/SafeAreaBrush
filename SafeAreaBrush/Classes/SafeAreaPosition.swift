//
//  SafeAreaPosition.swift
//  SafeAreaBrush
//
//  Created by WallabyStuff on 2022/06/22.
//

import Foundation

public enum SafeAreaPosition {
    case top
    case left
    case right
    case bottom
    
    var tag: Int {
        switch self {
        case .top:
            return 101
        case .left:
            return 102
        case .right:
            return 103
        case .bottom:
            return 104
        }
    }
}

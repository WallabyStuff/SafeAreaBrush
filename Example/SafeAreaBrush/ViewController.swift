//
//  ViewController.swift
//  SafeAreaBrush
//
//  Created by SunneyG on 06/22/2022.
//  Copyright (c) 2022 SunneyG. All rights reserved.
//

import UIKit
import SafeAreaBrush

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillSafeArea(position: .top, color: .cyan, gradient: true)
        fillSafeArea(position: .left, color: .red)
        fillSafeArea(position: .right, color: .green)
        fillSafeArea(position: .bottom, color: .blue, gradient: true)
    }
}


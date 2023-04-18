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
    
    fillSafeArea(position: .top, color: .systemPink, gradient: true)
    fillSafeArea(position: .left, color: .systemTeal)
    fillSafeArea(position: .right, color: .systemRed)
    fillSafeArea(position: .bottom, color: .systemGreen, gradient: true)
  }
  
  @IBAction func didTapRemoveButton(_ sender: Any) {
    removeSafeArea(position: .top)
  }
}


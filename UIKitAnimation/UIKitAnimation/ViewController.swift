//
//  ViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 29/04/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    var imgView: CircleView = CircleView(x: 10, y: 10, width: 200)

    override func viewDidLoad() {
        view.addSubview(imgView)
        super.viewDidLoad()
    }
}

#Preview {
    AnimationView()
}

//
//  Transition.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 02/05/24.
//

import UIKit

class TransitionAnimationViewController: BaseAnimationViewController {
    override func viewDidLoad() {

        super.viewDidLoad()

        titlePage = "Transition"
        nextPage = OptionsAnimationViewController()

    }
    
    override func runAnimate() {
        UIView.animate(withDuration: 2) {
            self.circleView.layer.opacity = 0
        }
    }
}

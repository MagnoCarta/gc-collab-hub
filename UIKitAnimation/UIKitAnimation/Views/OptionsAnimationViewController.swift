//
//  OptionsAnimateViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit

class OptionsAnimationViewController: BaseAnimationViewController {

    override func viewDidLoad() {

        titlePage = "Options"
        nextPage = CompletionAnimationController()

        super.viewDidLoad()
    }

    override func runAnimate() {
        UIView.animate(withDuration: 1, delay: 1, options: [.repeat]) {
            self.circleView.frame.origin = CGPoint(x: 300, y: 300)
        } completion: { Bool in
            self.circleView.frame.origin = CGPoint(x: 50, y: 100)
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.circleView.frame.origin = CGPoint(x: 50, y: 100)
    }
}

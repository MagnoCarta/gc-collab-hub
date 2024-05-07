//
//  OptionsAnimateViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit
import SwiftUI

class OptionsAnimationViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        titlePage = "Options"
        nextPage = CompletionAnimationController()
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

#Preview {
    ViewControllerToPreview { OptionsAnimationViewController.self }
}

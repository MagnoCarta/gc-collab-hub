//
//  KeyFrameAnimationViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit
import SwiftUI

class KeyFrameAnimationViewController: BaseAnimationViewController {

    override func viewDidLoad() {

        nextPage = TransitionAnimationViewController()
        titlePage = "KeyFrame"

        super.viewDidLoad()
    }

    override func runAnimate() {
        UIView.animateKeyframes(withDuration: 4, delay: 1) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.10) {
                self.circleView.frame.origin = CGPoint(x: 200, y: 200)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.10) {
                self.circleView.frame.origin = CGPoint(x: 320, y: 180)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.10) {
                self.circleView.frame.origin = CGPoint(x: 120, y: 100)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.10) {
                self.circleView.frame.origin = CGPoint(x: 120, y: 200)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.10) {
                self.circleView.frame.origin = CGPoint(x: 50, y: 100)
            }
        }
    }
}

#Preview {
    ViewControllerToPreview { KeyFrameAnimationViewController.self }
}

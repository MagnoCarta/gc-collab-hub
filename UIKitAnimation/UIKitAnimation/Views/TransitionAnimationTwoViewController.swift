//
//  TransitionAnimationTwoViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 03/05/24.
//

import UIKit
import SwiftUI

class TransitionAnimationTwoViewController: BaseAnimationViewController {
    
    var isRedViewVisible = true
    
    var circleViewBlack: UIView! // UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleViewBlack = CircleView(x: 50, y: 100, width: 150)
        circleViewBlack.backgroundColor = .black
        view.addSubview(circleViewBlack)
    }
    
    override func runAnimate() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        if(isRedViewVisible){
            UIView.transition(from: self.circleView,
                              to: self.circleViewBlack,
                              duration: 1.0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }else {
            UIView.transition(from: self.circleViewBlack,
                              to: self.circleView,
                              duration: 1.0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        isRedViewVisible.toggle()
        
    }
}

#Preview {
    ViewControllerToPreview { TransitionAnimationTwoViewController.self }
}

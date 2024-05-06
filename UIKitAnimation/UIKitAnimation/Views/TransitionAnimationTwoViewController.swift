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
        circleViewBlack = CircleView(x: 50, y: 100, width: 300)
        circleViewBlack.backgroundColor = .systemBlue
        circleViewBlack.alpha = 0
        print(circleViewBlack.isHidden)
        view.addSubview(circleViewBlack)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(runAnimate))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func runAnimate() {
        let transitionOptions: UIView.AnimationOptions = [.showHideTransitionViews, .transitionCrossDissolve]
        if(isRedViewVisible){
            self.circleViewBlack.alpha = 1
            UIView.transition(from: self.circleView,
                              to: self.circleViewBlack,
                              duration: 1.0,
                              options: transitionOptions,
                              completion: nil)
        }else {
            UIView.transition(from: self.circleViewBlack,
                              to: self.circleView,
                              duration: 1.0,
                              options: transitionOptions,
                              completion: nil)
        }
        isRedViewVisible.toggle()
        
    }
}

#Preview {
    ViewControllerToPreview { TransitionAnimationTwoViewController.self }
}

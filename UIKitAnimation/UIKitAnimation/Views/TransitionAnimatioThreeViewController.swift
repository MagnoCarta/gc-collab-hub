//
//  TransitionAnimatioThreeViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 07/05/24.
//

import UIKit
import SwiftUI

class TransitionAnimationThreeViewController: BaseAnimationViewController {
    
    var isRedViewVisible = true
    
    var circleViewBlack: UIView! // UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlePage = "Transition 3"
        nextPage = CALayersAnimationViewController()
        circleViewBlack = CircleView(x: 50, y: 100, width: 300)
        circleViewBlack.backgroundColor = .systemBlue
        circleViewBlack.alpha = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(runAnimate))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(runAnimate))// Por algum motivo o mesmo tapgesture n pode ser colocado em mais de um
        circleViewBlack.addGestureRecognizer(tapGesture)
        circleView.addGestureRecognizer(tapGesture2)
        view.addSubview(circleViewBlack)
    }
    
    override func runAnimate() {
        let transitionOptions: UIView.AnimationOptions = [.showHideTransitionViews, .transitionCrossDissolve]
        
        if(isRedViewVisible){
            
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
                
                self.circleView.frame.origin = CGPoint(x: 120, y: 180)
                
            } completion: { bool in
                
                self.circleViewBlack.alpha = 1
                UIView.transition(from: self.circleView,
                                  to: self.circleViewBlack,
                                  duration: 0.5,
                                  options: transitionOptions,
                                  completion: nil)
            }
        } else {
            
            UIView.transition(from: self.circleViewBlack,
                              to: self.circleView,
                              duration: 1.0,
                              options: transitionOptions) { Bool in
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
                    self.circleView.frame.origin = CGPoint(x: 50, y: 100)
                }
            }
        }
        isRedViewVisible.toggle()
        
    }
}

#Preview {
    ViewControllerToPreview { TransitionAnimationThreeViewController.self }
}

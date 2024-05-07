//
//  Transition.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 02/05/24.
//

import UIKit
import SwiftUI

class TransitionAnimationViewController: BaseAnimationViewController {
    var circleIsShowing: Bool = true
    var squareView = UIView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titlePage = "Transition"
        nextPage = TransitionAnimationTwoViewController()
        squareView.frame = CGRect(
            x: self.circleView.frame.minX,
            y: self.circleView.frame.minY,
            width: 100,
            height: 100
        )
        squareView.backgroundColor = .black
    }
    
    override func runAnimate() {
        UIView.transition(with: self.view, duration: 0.5, options: [.curveEaseIn, .transitionCurlDown]) {
            if(self.circleIsShowing){
                self.circleView.removeFromSuperview()
                self.view.addSubview(self.squareView)
                self.circleIsShowing.toggle()
            }else {
                self.squareView.removeFromSuperview()
                self.view.addSubview(self.circleView)
                self.circleIsShowing.toggle()
            }
        }
    }
}

#Preview {
    ViewControllerToPreview { TransitionAnimationViewController.self }
}

//
//  AnimationIntroductionViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit

class IntroductionAnimationViewController: ViewController {
    override func viewDidLoad() {
        navigationItem.title = "Introduction"
        super.viewDidLoad()
    }
    
    override func runAnimate(){
        UIView.animate(withDuration: 2, delay: 1, options: .curveEaseInOut) {
            self.circleView.backgroundColor = .black
            self.circleView.frame.origin = CGPoint(x: 200, y: 100)
            self.circleView.transform = CGAffineTransform(scaleX: 2, y: 2)
        } completion: { _ in
            self.circleView.backgroundColor = .systemBlue
            self.circleView.transform = .identity
            self.circleView.frame.origin = CGPoint(x: 50, y: 100)
        }
    }
    
    override func nextPage() {
        let vc = OptionsAnimationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

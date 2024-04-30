//
//  ViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 29/04/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let buttonRun: ButtonUIView =  ButtonUIView(x: 50, y: 500, width: 100, height: 60, title: "Run")
    
    let buttonNext: ButtonUIView = ButtonUIView(x: 250, y: 500, width: 100, height: 60, title: "Next")
    
    // initial State x = 50; y = 100; width: 150
    let circleView: CircleView = CircleView(x: 50, y: 100, width: 150) // UIView
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttonRun.addTarget(self, action: #selector(runAnimate), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
        view.addSubview(circleView)
        view.addSubview(buttonRun)
        view.addSubview(buttonNext)
    }
    
    @objc func runAnimate(){
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

    
    @objc func nextPage(){
        print("next")
    }
}

#Preview {
    AnimationView()
}

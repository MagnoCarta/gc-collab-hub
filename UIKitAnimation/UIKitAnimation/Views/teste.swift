//
//  teste.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit

class Teste: UIViewController {
    var buttonRun: ButtonUIView  {ButtonUIView(x: 50, y: 500, width: 100, height: 60, type: .playAnimation)}
    
    var buttonNext: ButtonUIView {ButtonUIView(x: 250, y: 500, width: 100, height: 60, type: .nextPage)}
    
    // initial State x = 50; y = 100; width: 150
    var circleView: CircleView { CircleView(x: 50, y: 100, width: 150)} // UIView
    @objc func runAnimate() {
        
      print("run")
    }
    
    @objc func nextPage() {
        
        print("next")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonRun.addTarget(self, action: #selector(runAnimate), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
        view.addSubview(circleView)
        view.addSubview(buttonRun)
        view.addSubview(buttonNext)
    }
}

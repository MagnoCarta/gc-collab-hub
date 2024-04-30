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
    }

    @objc func nextPage(){
    }
}

#Preview {
    AnimationView()
}

protocol ViewControllerProtocol {
    func runAnimate()
    func nextPage()
}

extension ViewControllerProtocol {
    var buttonRun: ButtonUIView  {ButtonUIView(x: 50, y: 500, width: 100, height: 60, title: "Run")}
    
    var buttonNext: ButtonUIView {ButtonUIView(x: 250, y: 500, width: 100, height: 60, title: "Next")}
    
    // initial State x = 50; y = 100; width: 150
    var circleView: CircleView { CircleView(x: 50, y: 100, width: 150)} // UIView
    
}

class ViewControllerProtocolFacade: UIViewController, ViewControllerProtocol {
    @objc func runAnimate() {
        print("AAAA")
    }
    
    @objc func nextPage() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        buttonRun.addTarget(self, action: #selector(runAnimate), for: .touchUpInside)
//        buttonNext.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
//        
//        view.addSubview(circleView)
//        view.addSubview(buttonRun)
//        view.addSubview(buttonNext)
    }
    
}

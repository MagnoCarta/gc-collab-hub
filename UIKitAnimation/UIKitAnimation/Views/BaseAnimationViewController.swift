//
//  ViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 29/04/24.
//

import UIKit
import SwiftUI

class BaseAnimationViewController: UIViewController {
    
    var nextPage: BaseAnimationViewController? = nil
    
    var titlePage: String? = nil {
        didSet {
            navigationItem.title = titlePage
        }
    }

    let buttonRun: ButtonUIView =  ButtonUIView(x: 140, y: 600, width: 100, height: 60, type: .playAnimation)
    
    let buttonNext: ButtonUIView = ButtonUIView(x: 280, y: 600, width: 100, height: 60, type: .nextPage)
    
    let buttonBack: ButtonUIView = ButtonUIView(x: 20, y: 600, width: 100, height: 60, type: .backPage)
    
    // initial State x = 50; y = 100; width: 150
    let circleView: CircleView = CircleView(x: 50, y: 100, width: 150) // UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        buttonRun.addTarget(self, action: #selector(runAnimate), for: .touchUpInside)
        buttonRun.frame.origin = CGPoint(x: view.frame.width * 0.5 - 50, y: view.frame.height * 0.70)

        buttonNext.addTarget(self, action: #selector(nextPageTarget), for: .touchUpInside)
        buttonNext.frame.origin = CGPoint(x: view.frame.width * 0.9 - 80, y: view.frame.height * 0.70)

        buttonBack.addTarget(self, action: #selector(backPageTarget), for: .touchUpInside)
        buttonBack.frame.origin = CGPoint(x: view.frame.width * 0.1 - 20, y: view.frame.height * 0.70)
        
        view.addSubview(circleView)
        view.addSubview(buttonRun)
        view.addSubview(buttonNext)
        if(navigationController?.viewControllers.first != self){
            view.addSubview(buttonBack)
        }
    }
    
    @objc func runAnimate(){
    }

    @objc func nextPageTarget(){
        if let nextPage {
            guard let pageInNavigation = self.navigationController?.viewControllers.first(where: { $0.isKind(of: type(of: nextPage)) }) else {
                self.navigationController?.pushViewController(nextPage, animated: true)
                return
            }
                self.navigationController?.popToViewController(pageInNavigation, animated: true)
        }
    }
    @objc func backPageTarget(){
        self.navigationController?.popViewController(animated: true)
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
    var buttonRun: ButtonUIView  {ButtonUIView(x: 50, y: 500, width: 100, height: 60, type: .playAnimation)}
    
    var buttonNext: ButtonUIView {ButtonUIView(x: 250, y: 500, width: 100, height: 60, type: .nextPage)}
    
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

//
//  UiViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 24/04/24.
//

import Foundation
import UIKit
import SwiftUI

class AnimationViewController: UIViewController {
    
    let imgView: UIImageView
    let buttonInitAnimate: UIButton
    let buttonStopAnimate: UIButton
    let nextPageButton: UIButton
    var animationOptions: UIView.AnimationOptions = .repeat
    var animator: UIViewPropertyAnimator = UIViewPropertyAnimator()
    init() {
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.blue.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.green.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imgView = UIImageView(image: img)
        buttonInitAnimate = UIButton()
        buttonInitAnimate.setTitle("Loop", for: .normal)
        buttonInitAnimate.setTitleColor(.black, for: .normal)
        buttonInitAnimate.backgroundColor = .darkGray
        
        buttonStopAnimate = UIButton()
        buttonStopAnimate.setTitle("STOP", for: .normal)
        buttonStopAnimate.setTitleColor(.black, for: .normal)
        buttonStopAnimate.backgroundColor = .darkGray
        
        nextPageButton = UIButton(type: .system)
        nextPageButton.setTitle("Next", for: .normal)
        nextPageButton.setTitleColor(.black, for: .normal)
        nextPageButton.backgroundColor = .darkGray
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func runLoop() {
        
        animator.startAnimation()
        //        UIView.animate(withDuration: 1, delay: 0.5, options: [.autoreverse, animationOptions]) {
        //            self.imgView.backgroundColor = .brown
        //            self.imgView.frame.size.width -= 125
        //            self.imgView.frame.size.height -= 100
        //        }
    }
    @objc func stopLoop() {
        animator.pauseAnimation()
        //        self.animationOptions = .curveEaseOut
        //        UIView.setAnimationsEnabled(false)
        //        self.view.layer.removeAllAnimations()
        //        UIView.setAnimationsEnabled(true)
    }

    @objc func navigateToNextPage() {
        // Cria uma instância do SecondViewController
        let secondVC = LoadingAnimationViewController()
        
        // Obtém a instância do UINavigationController do aplicativo
        let navController = UINavigationController(rootViewController: secondVC)
        
        // Acessa a cena da janela relevante
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            // Obtém a janela relevante da cena
            if let window = windowScene.windows.first {
                // Define o UINavigationController como a raiz da janela
                window.rootViewController = navController
                window.makeKeyAndVisible()
            }
        }
    }

    
    
    override func viewDidLoad() {
        
        animator = UIViewPropertyAnimator(duration: 2.0,  curve: .easeOut ) {
            self.imgView.alpha = 0.5
            self.imgView.frame.origin = CGPoint(x: 120, y: 220)
            self.animationOptions = .repeat
        }
        
        //        animator.addCompletion {  _ in
        //            let reverseAnimator = UIViewPropertyAnimator(duration: 2.0, curve: .linear) {
        //                self.imgView.alpha = 1.0
        //                self.imgView.frame.origin = CGPoint(x: 0, y: 0)
        //            }
        //            reverseAnimator.startAnimation()
        //        }
        
        buttonInitAnimate.frame = CGRect(x: self.view.frame.width/2 - 30, y: self.view.frame.height/2 + 200, width: 60, height: 60)
        buttonInitAnimate.addTarget(self, action: #selector(runLoop), for: .touchUpInside)
        buttonStopAnimate.frame = CGRect(x: self.view.frame.width/2 - 30, y: self.view.frame.height/2 + 270, width: 60, height: 60)
        buttonStopAnimate.addTarget(self, action: #selector(stopLoop), for: .touchUpInside)
        nextPageButton.frame = CGRect(x: self.view.frame.width/2 + 50, y: self.view.frame.height/2 + 270, width: 60, height: 60)
        nextPageButton.addTarget(self, action: #selector(navigateToNextPage), for: .touchUpInside)
        
        super.viewDidLoad()
        self.view.addSubview(imgView)
        self.view.addSubview(buttonInitAnimate)
        self.view.addSubview(buttonStopAnimate)
        self.view.addSubview(nextPageButton)
        
        animateViewLoop()
        //        algo = /*nil*/
    }
    func animateViewLoop() {
        animator = UIViewPropertyAnimator(duration: 2.0,  curve: .easeOut ) {
            self.imgView.alpha = 0.5
            self.imgView.frame.origin = CGPoint(x: 120, y: 220)
        }
        animator.addCompletion { _ in
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations:  {
                self.imgView.alpha = 1
                self.imgView.frame.origin = CGPoint(x: 0, y: 0)
            }) {_ in
                self.animateViewLoop()
            }

        }
        animator.startAnimation()
    }
}

struct AnimationView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AnimationViewController {
        .init()
    }
    
    func updateUIViewController(_ uiViewController: AnimationViewController, context: Context) {
    }
    
    typealias UIViewControllerType = AnimationViewController
    
}


#Preview {
    AnimationView()
}

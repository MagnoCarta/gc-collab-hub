//
//  File.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 08/05/24.
//

import UIKit
import SwiftUI

class MovingAnimationsViewController: BaseAnimationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextPage = DragAndExpandAnimationViewController()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(runAnimateGesture(_:)))
        self.circleView.addGestureRecognizer(panGesture)
    }
    
    @objc func runAnimateGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        // Atualizando a posição da view com base no movimento do dedo do usuário
        UIView.animate(withDuration: 0.2, delay: 1, options: .curveEaseInOut) {
            self.circleView.center = CGPoint(
                x: self.circleView.center.x + translation.x,
                y: self.circleView.center.y + translation.y
            )
        }
        
        
        // Resetando o valor da tradução para evitar acumulação
        gesture.setTranslation(.zero, in: view)
    }
    override func runAnimate() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut) {
            self.circleView.frame.origin = CGPoint(
                x: 50,
                y: 100
            )
        }
    }
}

#Preview {
    ViewControllerToPreview { MovingAnimationsViewController.self }
}

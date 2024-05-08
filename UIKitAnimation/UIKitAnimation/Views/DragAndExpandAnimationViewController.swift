//
//  DragAndExpandAnimationViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 08/05/24.
//

import UIKit
import SwiftUI

class DragAndExpandAnimationViewController: BaseAnimationViewController {
    let text: UITextView = UITextView(frame: CGRect(x: 75, y: 400, width: 100, height: 100))
    
    override func viewDidLoad() {

        super.viewDidLoad()
        text.text = "Arraste para cá"
        text.backgroundColor = .clear
        view.addSubview(text)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(runAnimateGesture(_:)))
        self.circleView.addGestureRecognizer(panGesture)
    }

    @objc func runAnimateGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        var y = self.circleView.frame.origin.y + translation.y
        
        if(y > 300){
            y = 300
        }
        if(y < 0){
            y = 0
        }
        self.circleView.frame.origin = CGPoint(x: self.circleView.frame.origin.x, y: y)
        
        if(y >= 300){
            UIView.animate(withDuration: 0.85, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
                self.circleView.frame.size = CGSize(width: 300, height: 250)
                self.text.textColor = .white
                self.text.font = UIFont.systemFont(ofSize: 30)
                self.text.frame.size = CGSize(width: 220, height: 100)
                self.text.frame.origin = CGPoint(x: 100, y: 400)
                self.text.text = "Arrasta pra cima"
            }
        }
        else if(y <= 250){
            UIView.animate(withDuration: 0.85,delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
                self.text.textColor = .black
                self.text.font = UIFont.systemFont(ofSize: 12)
                self.text.frame.size = CGSize(width: 100, height: 100)
                self.text.frame.origin = CGPoint(x: 75, y: 400)
                self.text.text = "Arraste para cá"
            }
        } else{
            UIView.animate(withDuration: 0.85, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
                self.circleView.frame.size = CGSize(width: 150, height: 150)
            }
        }
        
        
        // Resetando o valor da tradução para evitar acumulação
        gesture.setTranslation(.zero, in: view)
    }

}

#Preview {
    ViewControllerToPreview { DragAndExpandAnimationViewController.self }
}

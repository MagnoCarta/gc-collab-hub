//
//  CALayersAnimationViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 07/05/24.
//

import UIKit
import SwiftUI

class CALayersAnimationViewController: BaseAnimationViewController {
    var myView: UIView!
    var trig: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        nextPage = MovingAnimationsViewController()
        myView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        myView.backgroundColor = .systemBlue
        self.circleView.removeFromSuperview()
        view.addSubview(myView)
    }
    override func runAnimate() {

        self.buttonRun.setImage(UIImage(systemName: trig ? "pause.fill": "play.fill"), for: .normal)

        if(!trig) {
            myView.layer.removeAnimation(forKey: "rotation")
        }else {
            rotateView(view: self.myView, duration: 2.0, value: [0, Double.pi / 2, Double.pi, Double.pi * 1.5, 0])
        }
        trig.toggle()
        
    }
    func rotateView(view: UIView, duration: Double, value: [Double]) {
        // Criando uma animação de rotação usando transformação de CAKeyframeAnimation
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.duration = duration
        animation.repeatCount = Float.infinity // Repetir a animação
        
        // Definindo os valores de rotação ao longo do tempo
        animation.values = value
        
        // Definindo os tempos em que os valores de rotação devem ser alcançados
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        
        // Definindo a função de timing da animação
        animation.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        ]
        
        // Adicionando a animação à camada da view
        view.layer.add(animation, forKey: "rotation")
    }
}

#Preview {
    ViewControllerToPreview { CALayersAnimationViewController.self }
}

//
//  HorizontalDeslizeAnimationViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 09/05/24.
//

import UIKit
import SwiftUI

class HorizontalDeslizeAnimationViewController: UIViewController {
    var isShowingDetails = false
    
    var initialOriginText: CGPoint = .init()
    var initialOriginRectangle: CGPoint = .init()
    var finalOriginText: CGPoint = .init()
    var showingOriginRectangle: CGPoint = .init()
    var finalOriginRectangle: CGPoint = .init()
    
    let rectangle: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let textButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mostrar Detalhes", for: .normal)
        button.frame.size = CGSize(width: 200, height: 25)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialOriginText = CGPoint(x: view.frame.width/2 - 100, y: view.frame.height/2 - 50)
        initialOriginRectangle = CGPoint(x: 0 - view.frame.width, y: self.view.frame.minY + 75)
        finalOriginText = CGPoint(x: self.view.frame.width/2 - 100, y: self.view.frame.minY + 25)
        showingOriginRectangle = CGPoint(x: self.view.frame.minX + 25, y: self.view.frame.minY + 75)
        finalOriginRectangle = CGPoint(x: self.view.frame.maxX, y: self.view.frame.minY + 75)
        
        textButton.frame.origin = initialOriginText
        textButton.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        
        rectangle.frame.origin =  initialOriginRectangle// Não aparece na tela
        rectangle.frame.size = CGSize(width: view.frame.width - 50, height: view.frame.height - 200)
        
        view.addSubview(textButton)
    }
    
    @objc func showDetails(){
        
        UIView.animate( withDuration: 0.4, delay: 0, options: .curveEaseInOut ) {
            self.textButton.frame.origin = self.isShowingDetails ? self.initialOriginText : self.finalOriginText
            
            self.rectangle.frame.origin = self.isShowingDetails ? self.finalOriginRectangle : self.showingOriginRectangle
            
            if( !self.isShowingDetails ) {
                self.view.addSubview(self.rectangle)
            }
        }completion: { _ in
            if(self.isShowingDetails){
                self.rectangle.removeFromSuperview()
                self.rectangle.frame.origin = self.initialOriginRectangle
            }
            self.isShowingDetails.toggle()
        }
    }
}

#Preview {
    ViewControllerToPreview { HorizontalDeslizeAnimationViewController.self }
}

//
//  CircleUIImageView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 29/04/24.
//

import UIKit

class CircleView: UIView {
    
    init(x: Double, y: Double, width: Double) {

        super.init(frame: CGRect(x: x, y: y, width: width, height: width) )
        
        layer.cornerRadius = width/2
        layer.masksToBounds = true
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  StackCircleView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 29/04/24.
//

import UIKit

class StackCircleView: UIStackView {
    init(circles: [CircleView]) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

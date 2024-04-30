//
//  buttonUIView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit
import SwiftUI

class ButtonUIView: UIButton {
    
    init(x: Int, y: Int, width: Int, height: Int, title: String) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        setTitle(title, for: .normal)
        setTitleColor(.blue, for: .normal)
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        
    }
    
    override var buttonType: UIButton.ButtonType { .infoLight }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#Preview {
    AnimationView()
}

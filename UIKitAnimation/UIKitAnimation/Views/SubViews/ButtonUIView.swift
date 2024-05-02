//
//  buttonUIView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit
import SwiftUI

class ButtonUIView: UIButton {
    
    init(x: Int, y: Int, width: Int, height: Int, type: ButtonTypeCustome) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        switch type {
        case .playAnimation:

            let image: UIImage = .init(systemName: "play.fill")!
            setImage(image, for: .normal)
            tintColor = .blue

        case .nextPage:
            setTitle("Next", for: .normal)
            setTitleColor(.blue, for: .normal)

        case .backPage:
            setTitle("Back", for: .normal)
            setTitleColor(.blue, for: .normal)
            
        }
        
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        
    }
    
    override var buttonType: UIButton.ButtonType { .infoLight }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum ButtonTypeCustome {
    case playAnimation
    case nextPage
    case backPage
}
#Preview {
    AnimationView()
}

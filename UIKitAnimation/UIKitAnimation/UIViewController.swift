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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
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

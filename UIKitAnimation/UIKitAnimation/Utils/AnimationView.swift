//
//  AnimationView.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 29/04/24.
//

import SwiftUI

struct AnimationView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NavigationViewController {
        .init(view: IntroductionAnimationViewController())
    }
    
    func updateUIViewController(_ uiViewController: NavigationViewController, context: Context) {
    }
    
    typealias UIViewControllerType = NavigationViewController
    
}

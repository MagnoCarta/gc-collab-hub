//
//  ViewControllerToPreview.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 03/05/24.
//

import SwiftUI

struct ViewControllerToPreview<T: UIViewController>: UIViewControllerRepresentable {
    
    var viewController: T
        
    init(_ viewController: () -> T.Type) {
        self.viewController = viewController().init()
    }
    

    func makeUIViewController(context: Context) -> T {
        self.viewController
    }
    
    func updateUIViewController(_ uiViewController: T, context: Context) {
    }
    
    typealias UIViewControllerType = T
    
}

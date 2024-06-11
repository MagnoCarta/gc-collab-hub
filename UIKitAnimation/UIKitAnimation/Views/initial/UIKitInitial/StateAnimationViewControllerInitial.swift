//
//  File.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 11/06/24.
//

import UIKit
import SwiftUI

class StateAnimationViewControllerInitial: UIViewController {
    
    var toggleTitle: UITextView = {
        var text = UITextView()
        text.text = "Alterar Estado"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 20)
        return text
    }()
    
    var toggleView: UISwitch = {
        var toggle: UISwitch = .init()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    var viewAnimated: UIView = {
        var view: UIView = .init()
        view.layer.cornerRadius = 20
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toggleView)
        view.addSubview(toggleTitle)
        view.addSubview(viewAnimated)
        
        toggleView.addTarget(self, action: #selector(didChangeToggle), for: .valueChanged)
        
        setupConstraint()
    }
    
    @objc func didChangeToggle() {
        self.viewAnimated.backgroundColor = self.toggleView.isOn ? .systemGreen : .systemRed
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            toggleTitle.centerYAnchor.constraint(equalTo: toggleView.centerYAnchor),
            toggleTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 50),
            toggleTitle.widthAnchor.constraint(equalToConstant: 200),
            toggleTitle.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            toggleView.bottomAnchor.constraint(equalTo: viewAnimated.topAnchor, constant: -25),
            toggleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            viewAnimated.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewAnimated.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewAnimated.widthAnchor.constraint(equalToConstant: 200),
            viewAnimated.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
}

#Preview {
    ViewControllerToPreview { StateAnimationViewControllerInitial.self }
}

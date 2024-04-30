//
//  CompletionAnimationController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 30/04/24.
//

import UIKit

class CompletionAnimationController: ViewController {
    override func viewDidLoad() {
        navigationItem.title = "Completion"
        super.viewDidLoad()
    }
    override func runAnimate() {
        UIView.animate(withDuration: 1, delay: 1) {
            self.circleView.frame.origin = CGPoint(x: 200, y: 200)
        } completion: { _ in
            UIView.animate(withDuration: 1, delay: 1) {
                self.circleView.frame.origin = CGPoint(x: 220, y: 200)
            } completion: { _ in
                UIView.animate(withDuration: 2, delay: 1) {
                    self.circleView.frame.origin = CGPoint(x: 250, y: 250)
                } completion: { _ in
                    UIView.animate(withDuration: 0.8, delay: 1) {
                        self.circleView.frame.origin = CGPoint(x: 100, y: 180)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.8) {
                            self.circleView.frame.origin = CGPoint(x: 100, y: 120)
                        } completion: { _ in
                            UIView.animate(withDuration: 0.8) {
                                self.circleView.frame.origin = CGPoint(x: 50, y: 125)
                            } completion: { _ in
                                UIView.animate(withDuration: 1, delay: 1) {
                                    self.circleView.frame.origin = CGPoint(x: 50, y: 100)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.circleView.frame.origin = CGPoint(x: 50, y: 100)
    }
    
    override func nextPage() {
        var vc = KeyFrameAnimationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

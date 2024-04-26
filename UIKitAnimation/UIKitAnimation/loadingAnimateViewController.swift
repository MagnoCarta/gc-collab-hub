//
//  loadingAnimateViewController.swift
//  UIKitAnimation
//
//  Created by Caio de Almeida Pessoa on 26/04/24.
//

import Foundation
import UIKit

class LoadingAnimationViewController: UIViewController {

    let buttonStopAnimate: UIButton
    init() {
        self.buttonStopAnimate = UIButton(type: .system)
        buttonStopAnimate.setTitle("finalizar", for: .normal)
        buttonStopAnimate.setTitleColor(.blue, for: .normal)
        buttonStopAnimate.backgroundColor = .darkGray
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let stackView: UIStackView = {
        $0.distribution = .fill
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 10
        return $0
    }(UIStackView())

    private let circleA = UIView()
    private let circleB = UIView()
    private let circleC = UIView()
    private lazy var circles = [circleA, circleB, circleC]
    var options: UIView.KeyframeAnimationOptions = [.repeat]
    
    var i: Int = 0
    @objc func pauseAnim() {
//        if i == 0 {
//            options = []
//            jumpDuration = 0
//            delayDuration = 0
//            buttonStopAnimate.setTitle("resume", for: .normal)
//            i = 1
//        }else {
            buttonStopAnimate.setTitle("Pause", for: .normal)
            options = [.repeat]
            jumpDuration = 0.30
            delayDuration = 1.25
            i = 0
//        }
        
        animate()
    }
    @objc func runAnimate() {
//        options = []
//        jumpDuration = 0.30
//        delayDuration = 1.25
//        animate()
        let delays = [0, 0.1, 0.2]
        for(index, circle) in circles.enumerated() {
            UIView.animate(withDuration: 0.5, delay: TimeInterval(delays[index])) {
                circle.frame.origin = CGPoint(x: Int.random(in: -100...100), y: Int.random(in: -100...100))
                circle.backgroundColor = .black
//                circle.frame.origin.y += 100
//                if(index == 2){
//                    circle.frame.origin.y += 200
//                }
            }completion: { Bool in
                self.pauseAnim()
            }
            

//            UIView.animateKeyframes(withDuration: 12, delay: 1) {
//                UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 4) {
//                    circle.frame.origin.x += 500
//                }
//            }
        }
    }
    var jumpDuration: Double = 0.30
    var delayDuration: Double = 1.25
    func animate() {

        let totalDuration: Double = delayDuration + jumpDuration*2

        let jumpRelativeDuration: Double = jumpDuration / totalDuration
        let jumpRelativeTime: Double = delayDuration / totalDuration
        let fallRelativeTime: Double = (delayDuration + jumpDuration) / totalDuration

        for (index, circle) in circles.enumerated() {
            let delay = jumpDuration*2 * TimeInterval(index) / TimeInterval(circles.count)
            UIView.animateKeyframes(withDuration: totalDuration, delay: delay, options: options, animations: {
                UIView.addKeyframe(withRelativeStartTime: jumpRelativeTime, relativeDuration: jumpRelativeDuration) {
                    circle.frame.origin = CGPoint(x: circle.frame.origin.x, y: circle.frame.origin.y - 30)
                }
                UIView.addKeyframe(withRelativeStartTime: fallRelativeTime, relativeDuration: jumpRelativeDuration) {
                    circle.frame.origin = CGPoint(x: circle.frame.origin.x, y: circle.frame.origin.y + 30)
                }
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStopAnimate.addTarget(self, action: #selector(runAnimate), for: .touchUpInside)
        buttonStopAnimate.frame = CGRect(x: self.view.frame.width/2 - 30, y: self.view.frame.height/2 + 270, width: 60, height: 60)
        view.backgroundColor = .white
        view.addSubview(stackView)
        view.addSubview(buttonStopAnimate)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circles.forEach {
            $0.layer.cornerRadius = 20/2
            $0.layer.masksToBounds = true
            $0.backgroundColor = .systemBlue
            stackView.addArrangedSubview($0)
            $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
            $0.heightAnchor.constraint(equalTo: $0.widthAnchor).isActive = true
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}



#Preview {
    LoadingAnimationViewController()
}

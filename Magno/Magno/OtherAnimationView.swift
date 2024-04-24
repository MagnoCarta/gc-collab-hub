//
//  OtherAnimationView.swift
//  Magno
//
//  Created by Gilberto Magno on 24/04/24.
//

import SwiftUI

struct OtherAnimationView: View {
    
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                circleCompleting
                loadingBarView
            }
        }
    }
    
    @State var angle: Angle = .zero
    
    var circleCompleting: some View {
        PieSegment(start: Angle(degrees: 0), end: angle)
            .foregroundStyle(.red)
    }
    
    @State var percentage: CGFloat = 1
    @State var isIncresing: Bool = true {
        didSet {
            sliderTimer()
        }
    }
    
    var loadingBarView: some View {
       Rectangle()
            .foregroundStyle(.blue)
            .frame(width: percentage, height: 56, alignment: .center)
            .onAppear {
                sliderTimer()
            }
    }
    
    func sliderTimer() {
        
        Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true, block: { timer in
            percentage += isIncresing ? 1 : -1
            angle.degrees += isIncresing ? 1 : -1
            if percentage >= 360 || percentage <= 1 {
                isIncresing.toggle()
                timer.invalidate()
            }
        })
        
    }
    
}

struct PieSegment: Shape {
    var start: Angle
    var end: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.midX, startAngle: start, endAngle: end, clockwise: false)
        return path
    }
}


#Preview {
    OtherAnimationView()
}

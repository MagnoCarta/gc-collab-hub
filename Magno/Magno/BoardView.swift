//
//  Board.swift
//  Magno
//
//  Created by Gilberto Magno on 10/04/24.
//

import SwiftUI

struct BoardView: View {
    
    @State var color: Color = .red
    @State var position: CGPoint = .init(x: 0, y: 0)
    @State var isCircleView: Bool = false
    @State var timer: Timer?
    
    var body: some View {
        
        NavigationStack {
            if !isCircleView {
                ZStack {
                    Color.blue.ignoresSafeArea()
                        .onTapGesture(coordinateSpace: .local) { location in
                            animateMoviment(from: self.position, to: location)
                        }
                        .overlay {
                            HStack {
                                Circle()
                                    .foregroundStyle(color)
                                    .frame(width: 100,height: 100)
                                    .position(self.position)
                                    .onTapGesture {
                                        print("CLICK")
                                        withAnimation {
                                            color = color == .green ? .red : .green
                                        }
                                    }
                            }
                        }
                    Rectangle()
                        .frame(width: 300,height: 80)
                        .onTapGesture {
                            withAnimation {
                                self.isCircleView = true
                            }
                        }
                }
                .transition(.moveAndFade)
            }
            if isCircleView {
                Rectangle()
                    .fill(.yellow)
                    .ignoresSafeArea()
                    .transition(.pivot)
                    .onTapGesture {
                        withAnimation {
                            self.isCircleView = false
                        }
                    }
                
            }
        }
        .gesture(
            DragGesture()
                .onChanged({ drag in
                    if self.position == drag.location {
                        self.timer?.invalidate()
                        self.timer = nil
                    }
                })
        )
        
    }
    
    func animateMoviment(from beginPosition: CGPoint, to finalPosition: CGPoint) {
        setupTimerMove(initial: beginPosition.x, final: finalPosition.x, isX: true)
        setupTimerMove(initial: beginPosition.y, final: finalPosition.y, isX: false)
    }
    
    func setupTimerMove(initial: CGFloat, final: CGFloat,isX: Bool) {
        var initialValue = initial
        let dif = (initial - final)/200
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.00125, repeats: true, block: { timer in
            initialValue -= dif
            if isX {
                self.updatePosition(x: initialValue, y: self.position.y)
            } else {
                self.updatePosition(x: self.position.x, y: initialValue)
            }
            let finalValue = initial - 200*dif
            if initialValue.rounded() == finalValue.rounded() {
                timer.invalidate()
            }
        })
        self.timer?.fire()
    }
    
    func updatePosition(x: CGFloat, y: CGFloat) {
        self.position = CGPoint(x: x, y: y)
    }
    
}

#Preview {
    BoardView()
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

//
//  BumpLightView.swift
//  VariantUI
//
//  Created by Sebastian Camilo Rozo  Rozo on 9/11/23.
//

import SwiftUI


struct BumpLightView : View {
    @State private var yOffset: CGFloat = 0
    @State private var isLightOn = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(isLightOn ? .yellow : .gray)
                    .opacity(0.7)
                    .animation(.easeInOut(duration: 0.5))
                
                ForEach(0..<8) { index in
                    Circle()
                        .frame(width: 10, height: 50)
                        .rotationEffect(.degrees(Double(index) * 45))
                        .offset(y: 25)
                        .foregroundColor(.yellow)
                        .opacity(isLightOn ? 1 : 0)
                        .animation(
                            Animation.easeInOut(duration: 0.5)
                                .delay(0.05 * Double(index))
                        )
                }
            }
            .offset(y: yOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        yOffset = value.translation.height
                    }
                    .onEnded { value in
                        yOffset = 0
                        isLightOn.toggle()
                    }
            )

            RopeView(yOffset: $yOffset)
        }
        .padding()
        .overlay(
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .offset(y: -25)
                .opacity(0.7)
        )
        .background(Color.black.edgesIgnoringSafeArea(.top))
    }
}

struct RopeView: View {
    @Binding var yOffset: CGFloat

    var body: some View {
        Rectangle()
            .frame(width: 5, height: 150)
            .offset(y: yOffset)
            .foregroundColor(.gray)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        yOffset = value.translation.height
                    }
                    .onEnded { value in
                        yOffset = 0
                    }
            )
    }
}

struct BumpLightView_Previews: PreviewProvider {
    static var previews: some View {
        BumpLightView()
    }
}

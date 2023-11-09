//
//  CircleLoadingAnimation.swift
//  VariantUI
//
//  Created by Camilo Rozo on 8/11/23.
//

import SwiftUI


struct CircleLoadingAnimation: View {
    @State private var oneCircle: Bool = false
    @State private var twoCircle: Bool = false
    @State private var threeCircle: Bool = false
    @State private var fourCircle: Bool = false
    @State private var fiveCircle: Bool = false
    @State private var sixCircle: Bool = false
    @State private var sevenCircle: Bool = false
    @State private var eightCircle: Bool = false
    @State private var nineCircle: Bool = false
    @State private var tenCircle: Bool = false
    
    func buildRing(index: Int, isAnimating: Binding<Bool>) -> some View {
        let delays: [Double] = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
        let delay = index < delays.count ? delays [index] : 0
        return  Circle()
            .stroke(lineWidth: 5)
            .foregroundColor(.white)
        
            .frame(width: CGFloat(20 + index * 30), height: CGFloat(20 + index * 30))
            .rotation3DEffect(
                .degrees(75),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .offset(y: isAnimating.wrappedValue ? -150 : 150)
            .onAppear() {
                withAnimation(
                    .easeInOut(duration: 1.5)
                    .repeatForever(autoreverses: true)
                    .delay(index == 0 ? 0 : Double(index) * 0.1 )) {
                        isAnimating.wrappedValue.toggle()
                    }
                
                
            }
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ZStack {
                // 0
                buildRing(index: 0, isAnimating: $oneCircle)
                
                // 1
                buildRing(index: 1, isAnimating: $twoCircle)
                
                // 2
                buildRing(index: 2, isAnimating: $threeCircle)
                
                // 3
                buildRing(index: 4, isAnimating: $fourCircle)
                
                // 4
                buildRing(index: 5, isAnimating: $fiveCircle)
                
                // 5
                buildRing(index: 6, isAnimating: $sixCircle)
                
                // 6
                buildRing(index: 7, isAnimating: $sevenCircle)
                
                // 7
                buildRing(index: 8, isAnimating: $eightCircle)
                
                // 8
                buildRing(index: 9, isAnimating: $nineCircle)
                
                // 9
                buildRing(index: 10, isAnimating: $tenCircle)
            }
            .padding()
        }
        
    }
}
/*struct CircleLoadingAnimation_Previews: PreviewProvider {
 static var previews: some View {
 CircleLoadingAnimation()
 }
 }
 */
#Preview {
    CircleLoadingAnimation()
}

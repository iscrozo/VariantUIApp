//
//  BulpLightView.swift
//  VariantUI
//
//  Created by Camilo Rozo on 9/11/23.
//

import SwiftUI

struct BulpLightView: View {
    
    @State private var showPassword: Bool = true
    @State private var pullChainOffset: CGFloat = 0.0
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            LinearGradient(colors: [.yellow.opacity(0.9), .white.opacity(0.9),.white.opacity(1)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .mask(
                TrapezoidShape()
            )
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.98)
            .colorMultiply(.white.opacity(0.7))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(y:-170)
            .opacity(showPassword ? 0 : 1)
            
            
            VStack(spacing: 0) {
                Capsule()
                    .frame(width: 2, height: 80)
                    .background(.white)
                Circle()
                    .background(.white)
                    .frame(width: 10, height: 10)
            }.position(x: 240, y: pullChainOffset)
//                .opacity(showPassword ? 1 : 0)
                .animation(.linear(duration: 0.1), value: pullChainOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            let diff = value.location.y - value.startLocation.y
                            
                            if diff <= 30 && diff >= 0 {
                                pullChainOffset = diff
                            } else if diff > 30 {
                                pullChainOffset = 30
                            } else {
                                pullChainOffset = 0
                            }
                        })
                        .onEnded({ value in
                            if value.location.y >= 25 {
                                showedPassword()
                            }
                            pullChainOffset = .zero
                        })
                )
            
            SignIn(username: $userName, password: $password, showPassword: $showPassword)
        }
        .preferredColorScheme(.dark)
    }
    
    func showedPassword() {
        if showPassword {
            showPassword.toggle()
        } else {
            showPassword.toggle()
            
            let iterations = Array(stride(from: 0, to: 6, by: 2)).randomElement() ?? 0
            for _ in 0..<iterations {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.01...0.3), execute: {
                    showPassword.toggle()
                })
            }
        }
    }
}

struct SignIn: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var showPassword: Bool
    
    let monoFont = Font.system(size: 16).monospaced()
    
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Capsule()
                    .stroke(lineWidth: 2)
                TextField("Username", text: $username)
                    .font(monoFont)
                    .padding()
            }.frame(height: 50)
                .padding([.leading, .trailing])
            
            ZStack {
                Capsule()
                    .stroke(lineWidth: 2)
                if !showPassword {
                    TextField("Password", text: $password)
                        .font(monoFont)
                        .padding()
                } else {
                    SecureField("Password", text: $password)
                        .font(monoFont)
                        .padding()
                }
            }.frame(height: 50)
                .padding([.leading, .trailing])
            
            Button(action: {}, label: {
                Text("Sign in")
                    .font(monoFont)
            })
            .buttonStyle(.plain)
        }
    }
}

struct TrapezoidShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 0.6, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.width * 0.4, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}


/* XCODE < 15 */
struct BulpLightView_Previews: PreviewProvider {
    static var previews: some View {
        BulpLightView()
    }
}

/* XCODE >=15 */
//#Preview {
//    ContentView()
//}


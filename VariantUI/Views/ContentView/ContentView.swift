//
//  ContentView.swift
//  VariantUI
//
//  Created by Camilo Rozo on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 30) {
                    headerSection()
                    shapesSection()
                }
            }
        }
    }
}

extension ContentView {
    
    func headerSection() -> some View {
        VStack(alignment: .center) {
            Text("Variant UI")
                .font(.title)
                .fontWeight(.bold)
            Text("by @iscrozo")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    func shapesSection() -> some View {
        VStack (alignment: .leading, spacing: 10, content: {
            Text("Shape Colors")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 10)
            HStack {
                VariantShapesViews()
            }
        })
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)

    }
}

#Preview {
    ContentView()
}

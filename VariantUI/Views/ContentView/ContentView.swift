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
                }
            }
        }
    }
}

extension ContentView {
    
    func headerSection() -> some View {
        VStack {
            Text("Variant UI")
                .font(.title)
                .fontWeight(.bold)
                .underline()
            Text("by @iscrozo")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
    }
    
    func shapesSection() -> some View {
        VStack (alignment: .leading, spacing: 10, content: {
            Text("Shape Colors")
                .font(.title2)
                .fontWeight(.medium)
            HStack {
                VariantShapesViews()
            }
        })
    }
}

#Preview {
    ContentView()
}

//
//  VariantShapesViews.swift
//  VariantUI
//
//  Created by Camilo Rozo on 6/11/23.
//

import SwiftUI

struct VariantShapesViews: View {
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                VariantShapesRandomView()
            }
        }
    }
}


struct VariantShapesRandomView: View {
    var body: some View {
        let shape = Int.random(in: 0..<5)
        let color = Color.random
        
        switch shape {
        case 0:
            return AnyView(Circle()
                .fill(color)
                .frame(width: 50, height: 50))
        case 1:
            return AnyView(Rectangle()
                .fill(color)
                .frame(width: 50, height: 50))
        case 2:
            return AnyView(RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 50, height: 50))
        case 3:
            return AnyView(Capsule()
                .fill(color)
                .frame(width: 50, height: 30))
        default:
            return AnyView( Ellipse()
                .fill(color)
                .frame(width: 50, height: 30))
        }
    }
}


struct VariantShapesViews_Previews: PreviewProvider {
    static var previews: some View {
        VariantShapesViews()
    }
}

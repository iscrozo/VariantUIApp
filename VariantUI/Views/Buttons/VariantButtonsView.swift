//
//  VariantButtonsView.swift
//  VariantUI
//
//  Created by Camilo Rozo on 8/11/23.
//

import SwiftUI

enum VariantButtonStyle {
    case standard
    case padded
    case rounded
    case shadowed
    case loading
}

// MARK: Button View
struct VariantButtonsView {
    static func getVariantButton(
        _ variant: VariantButtonStyle,
        action: @escaping () -> Void,
        label: String,
        backgroundColor: Color? = nil,
        foregroundColor: Color? = nil
    ) -> some View {
        switch variant {
        case .standard:
            return AnyView(ComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor))
        case .padded:
            return AnyView(PaddedComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor))
        case .rounded:
            return AnyView(RoundedComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor))
        case .shadowed:
            return AnyView(ShadowedComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor))
        case .loading:
            return AnyView(LoadingComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor))
        }
    }
}

// MARK: structure Button View
struct ComponentButtonView: View {
    var action: () -> Void
    var label: String
    var backgroundColor: Color? = nil
    var foregroundColor: Color? = nil
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Button(action: action) {
            Text(label)
                .fontWeight(.medium)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(backgroundColor ?? .primary)
                .foregroundColor(foregroundColor ?? (colorScheme == .dark ? .black : .white))
                .cornerRadius(8)
        }
    }
}

// MARK: Variants button
struct PaddedComponentButtonView: View {
    var action: () -> Void
    var label: String
    var backgroundColor: Color? = nil
    var foregroundColor: Color? = nil
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor)
            .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
    }
}

struct RoundedComponentButtonView: View {
    var action: () -> Void
    var label: String
    var backgroundColor: Color? = nil
    var foregroundColor: Color? = nil
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor)
            .cornerRadius(16)
    }
}

struct ShadowedComponentButtonView: View {
    var action: () -> Void
    var label: String
    var backgroundColor: Color? = nil
    var foregroundColor: Color? = nil
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ComponentButtonView(action: action, label: label, backgroundColor: backgroundColor, foregroundColor: foregroundColor)
            .shadow(color: Color.black.opacity(1), radius: 5, x: 0, y: 2)
    }
}

struct LoadingComponentButtonView: View {
    @State private var isLoading = false
    
    var action: () -> Void
    var label: String
    var backgroundColor: Color? = nil
    var foregroundColor: Color? = nil
    
    var body: some View {
        Button(action: {
            isLoading.toggle()
            action()
        }) {
            if isLoading {
                VStack {
                    Text("Loading...")
                        .foregroundColor(.gray)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .padding(.top, 8)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .frame(width: 120, height: 120)
            } else {
                Text(label)
                    .fontWeight(.medium)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(backgroundColor ?? .primary)
                    .foregroundColor(foregroundColor ?? .white)
                    .cornerRadius(8)
            }
        }
    }
}

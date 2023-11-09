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
                    buttonSection()
                    cardSection()
                }.padding(.horizontal,10)
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
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
    
    func titleSection(_ title: String) -> some View {
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
            .padding(.top, 10)
            .padding(.leading, 10)
    }
    
    func shapesSection() -> some View {
        VStack (alignment: .leading, spacing: 10, content: {
            titleSection("Shape Colors")
            ScrollView(.horizontal) {
                HStack(spacing: 2) {
                    VariantShapesViews()
                }
            }
        })
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        
    }
    
    func buttonSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            titleSection("Buttons")
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    VariantButtonsView.getVariantButton(.padded, action: {
                        print("button Padded")
                    }, label: "Button 1", backgroundColor: .green)
                    
                    VariantButtonsView.getVariantButton(.loading, action: {
                        print("button loading")
                    }, label: "Button 2", backgroundColor: .random)
                    
                    VariantButtonsView.getVariantButton(.shadowed, action: {
                        print("button shadowed")
                    }, label: "Button 3", backgroundColor: .blue)
                    
                    VariantButtonsView.getVariantButton(.rounded, action: {
                        print("button rounded")
                    }, label: "Button 4", backgroundColor: .red)
                    
                    VariantButtonsView.getVariantButton(.standard, action: {
                        print("button shadowed")
                    }, label: "Button 5", backgroundColor: .random)
                    
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    func cardSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            titleSection("Cards")
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    VariantCardView(
                        title: "Variante con fondo azul",
                        description: "Descripción en azul",
                        content: "Contenido",
                        footer: "Pie de página",
                        backgroundColor: .blue,
                        titleColor: .white,
                        descriptionColor: .blue,
                        contentColor: .black,
                        footerColor: .white
                    )
                    VariantCardView(
                        title: "Título Personalizado",
                        description: "Una descripción detallada del componente",
                        content: "Contenido adicional",
                        footer: "Pie de página informativo",
                        backgroundColor: .green,
                        titleColor: .white,
                        descriptionColor: .gray,
                        contentColor: .black,
                        footerColor: .white
                    )
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}

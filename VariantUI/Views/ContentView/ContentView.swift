//
//  ContentView.swift
//  VariantUI
//
//  Created by Camilo Rozo on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack (alignment: .leading, spacing: 30) {
                        headerSection()
                        shapesSection()
                        buttonSection()
                        cardSection()
                        navigateButtons()
                    }.padding(.horizontal,10)
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
    
    func customContainerView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            content()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    func shapesSection() -> some View {
        customContainerView {
            titleSection("Shape Colors")
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    VariantShapesViews()
                }
            }
        }
    }
    
    func buttonSection() -> some View {
        
        customContainerView {
            titleSection("Buttons")
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
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
    }
    
    func cardSection() -> some View {
        
        customContainerView {
            titleSection("Cards")
            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    VariantCardView(
                        title: "Lorem ipsum",
                        description: "Duis aute irure dolor in reprehenderit in \n voluptate velit esse cillum dolore \neu fugiat nulla pariatur",
                        content: "Lorem ipsum dolor sit amet ",
                        footer: "Inspired by Ciceron"
                    )
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
        
        
    }
    
    func navigateButtons() -> some View {
        customContainerView {
            titleSection("Animations")
            ScrollView(.horizontal) {
                
                HStack( spacing: 10) {
                    NavigationLink(destination: CircleLoadingAnimation()) {
                        HStack(alignment: .center, spacing: 10) {
                            Text("Animation Circle")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding([.top, .bottom, .leading], 10 )
                                .padding(.trailing, 1)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                        }   .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: BumpLightView()) {
                        HStack(alignment: .center, spacing: 10) {
                            Text("Animation Circle")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding([.top, .bottom, .leading], 10 )
                                .padding(.trailing, 1)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                        }   .background(Color.blue)
                            .cornerRadius(10)
                    }

                }
                
                
            }.padding(5)
        }
    }
}

/* XCODE < 15 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/* XCODE >=15 */
//#Preview {
//    ContentView()
//}


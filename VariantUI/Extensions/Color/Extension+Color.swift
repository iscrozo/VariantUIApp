//
//  Extension+Color.swift
//  VariantUI
//
//  Created by Camilo Rozo on 6/11/23.
//
 
import SwiftUI


extension Color {
    static var random: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}

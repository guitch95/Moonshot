//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Guillaume Richard on 23/02/2026.
//

import SwiftUI

// Extending ShapeStyle but only when it's a Color.
// extension Color → .background(Color.darkBackground)
// extension ShapeStyle where Self == Color → .background(.darkBackground)

//Il s'agit ici de sucre syntaxique.


extension ShapeStyle where Self == Color {
    static var darkBackground: Color { Color(red: 0.1, green: 0.1, blue: 0.2) }

    static var lightBackground: Color { Color(red:0.2, green: 0.2, blue: 0.3)}
    
}

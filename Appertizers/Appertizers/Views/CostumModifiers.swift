//
//  CostumModifiers.swift
//  Appertizers
//
//  Created by Simon Bogutzky on 24.10.21.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

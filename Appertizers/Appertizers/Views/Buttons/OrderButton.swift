//
//  OrderButton.swift
//  Appertizers
//
//  Created by Simon Bogutzky on 21.10.21.
//

import SwiftUI

struct OrderButton: View {
    var title: String
    var textColor = Color.white
    var backgroundColor = Color.brandPrimary
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}

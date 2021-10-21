//
//  AppetizerListView.swift
//  Appertizers
//
//  Created by Simon Bogutzky on 15.10.21.
//

import SwiftUI

struct AppetizerListView: View {
    
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

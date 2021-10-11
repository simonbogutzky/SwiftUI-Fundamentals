//
//  FrameworkListViewModel.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 11.10.21.
//

import SwiftUI

final class FrameworkListViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    let coloums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @Published var isShowingDetailView = false
}

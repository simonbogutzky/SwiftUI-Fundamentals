//
//  AppertizersApp.swift
//  Appertizers
//
//  Created by Simon Bogutzky on 15.10.21.
//

import SwiftUI

@main
struct AppertizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}

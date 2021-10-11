//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 07.10.21.
//

import SwiftUI

struct FrameworkGridView: View {
    
    let coloums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: coloums) {
            FrameworkTitleView(
                name: "App Clip",
                imageName: "app-clip"
            )
            FrameworkTitleView(
                name: "App Clip",
                imageName: "app-clip"
            )
            FrameworkTitleView(
                name: "App Clip",
                imageName: "app-clip"
            )
            FrameworkTitleView(
                name: "App Clip",
                imageName: "app-clip"
            )
            FrameworkTitleView(
                name: "App Clip",
                imageName: "app-clip"
            )
            FrameworkTitleView(
                name: "App Clip",
                imageName: "app-clip"
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

struct FrameworkTitleView: View {
    let name: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}

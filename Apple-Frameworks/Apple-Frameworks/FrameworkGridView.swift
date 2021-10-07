//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 07.10.21.
//

import SwiftUI

struct FrameworkGridView: View {
    var body: some View {
        HStack {
            
            VStack {
                Image("app-clip")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                Text("App Clip")
                    .lineLimit(1)
            }
            
            VStack {
                Image("arkit")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                Text("ARKit")
            }
            
            VStack {
                Image("carplay")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFit()
                Text("Carplay")
                    .lineLimit(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

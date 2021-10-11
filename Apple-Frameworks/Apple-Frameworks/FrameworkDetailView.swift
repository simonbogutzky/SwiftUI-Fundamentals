//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 11.10.21.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    var body: some View {
        VStack {
            FrameworkTitleView(framework: framework)
            Text(framework.description)
            Button("Learn More") {
                
            }
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(Color.white)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
        }
        
        
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework)
            .preferredColorScheme(.dark)
    }
}

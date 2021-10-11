//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 11.10.21.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            VStack {
                Text(framework.description)
                    .font(.body)
                    .padding()
                
                Button {
                    isShowingSafariView = true
                } label: {
                    AFButton(title: "Learn More")
                }
                .padding()
                
            }
            .background(Color(UIColor.secondaryLabel))
            .cornerRadius(10)
            .padding()
            
            Spacer()
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: (URL(string: framework.urlString) ?? URL(string: "https://www.apple.com"))!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 11.10.21.
//

import SwiftUI

struct FrameworkDetailView: View {

    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework)
            
            VStack {
                Text(viewModel.framework.description)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                Link(destination: URL(string: viewModel.framework.urlString) ?? URL(string: "https://www.apple.com")!) {
                    Label("Learn More", systemImage: "book.fill")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .foregroundColor(.blue)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .tint(.red)
                .padding()
                
//                Button {
//                    viewModel.isShowingSafariView = true
//                } label: {
//                    Label("Learn More", systemImage: "book.fill")
//                    //AFButton(title: "Learn More")
//                }
//                .buttonStyle(.borderedProminent)
//                .controlSize(.large)
//                //.foregroundColor(.blue)
//                //.buttonBorderShape(.roundedRectangle(radius: 10))
//                .tint(.red)
//                .padding()
                
            }
            .background(Color(UIColor.secondaryLabel))
            .cornerRadius(10)
            .padding()
            
            Spacer()
        }
//        .fullScreenCover(isPresented: $viewModel.isShowingSafariView) {
//            SafariView(url: (URL(string: viewModel.framework.urlString) ?? URL(string: "https://www.apple.com"))!)
//        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)))
            .preferredColorScheme(.dark)
    }
}

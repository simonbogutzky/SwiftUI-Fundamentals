//
//  FrameworkListView.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 07.10.21.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel: FrameworkListViewModel = FrameworkListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: framework, isShowingDetailView: $viewModel.isShowingDetailView))) {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
            .preferredColorScheme(.dark)
    }
}

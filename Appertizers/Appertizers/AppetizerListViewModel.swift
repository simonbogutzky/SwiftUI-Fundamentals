//
//  AppetizerListViewModel.swift
//  Appertizers
//
//  Created by Simon Bogutzky on 21.10.21.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    break
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            }
        }
    }
}

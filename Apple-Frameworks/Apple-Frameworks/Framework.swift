//
//  Framework.swift
//  Apple-Frameworks
//
//  Created by Simon Bogutzky on 07.10.21.
//

import Foundation

struct Framework: Hashable, Identifiable {
    let id = UUID()
    var name: String
    var imageName: String
    var urlString: String
    var description: String
}

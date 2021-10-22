//
//  User.swift
//  Appertizers
//
//  Created by Simon Bogutzky on 22.10.21.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequentRefills = false
}

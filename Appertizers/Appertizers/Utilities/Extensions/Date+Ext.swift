//
//  Date+Ext.swift
//  Appertizers
//
//  Created by Simon Bogutzky on 24.10.21.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}

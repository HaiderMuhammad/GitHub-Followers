//
//  Date+Ext.swift
//  GitHub-Followers
//
//  Created by APPLE on 09/06/2023.
//

import Foundation


extension Date {
    func convertToMYFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}

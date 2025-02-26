//
//  CountryCodeFlag.swift
//  AgifyApp
//
//  Created by Amr Omran on 26.02.25.
//

import Foundation

struct CountryCodeFlag: Identifiable {
    let name: String
    let code: String?
    let flag: String
    
    var id = UUID()
}

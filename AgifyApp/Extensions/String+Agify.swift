//
//  String+Agify.swift
//  AgifyApp
//
//  Created by Amr Omran on 25.02.25.
//

import Foundation

extension String {
    
    var countryNameFromCode: String? {
        Locale.current.localizedString(forRegionCode: self)
    }
}

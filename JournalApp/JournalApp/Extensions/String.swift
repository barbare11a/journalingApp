//
//  String.swift
//  JournalApp
//
//  Created by barbarella castillo on 7/15/23.
//

import Foundation

extension String {
    func isValidEmail () -> Bool{
        let regex = try! NSRegularExpression (pattern: "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
                                              options: .caseInsensitive)
        return regex.firstMatch(in: self, range: NSRange (location: 0, length: count)) != nil
    }
}


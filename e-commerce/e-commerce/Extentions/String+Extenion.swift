//
//  String+Extenion.swift
//  e-commerce
//
//  Created by ahmed on 7/1/18.
//  Copyright © 2018 Organization. All rights reserved.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines) //that delete spacing befor and after text
    }
}



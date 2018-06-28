//
//  Category.swift
//  e-commerce
//
//  Created by ahmed on 6/27/18.
//  Copyright © 2018 Organization. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

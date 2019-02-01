//
//  Document.swift
//  Documents
//
//  Created by Madison Williams on 1/30/19.
//  Copyright © 2019 Madison Williams. All rights reserved.
//

import Foundation

struct Document{
    let url : URL
    let name : String
    let size : Int
    let lastModified: Date
    var content : String? {
        return try? String(contentsOf: url, encoding: .utf8)
    }
}

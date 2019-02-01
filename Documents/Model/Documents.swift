//
//  Documents.swift
//  Documents
//
//  Created by Madison Williams on 1/30/19.
//  Copyright © 2019 Madison Williams. All rights reserved.
//

import Foundation

class Documents {
    
    class func get() -> [Document] {
        var documents = [Document]()
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        if let urls = try? FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil) {
            for url in urls {
                let name = url.lastPathComponent
                if let attributes = try? FileManager.default.attributesOfItem(atPath: url.path),
                    let size = attributes[FileAttributeKey.size] as? Int,
                    let lastModified = attributes[FileAttributeKey.modificationDate] as? Date {
                    documents.append(Document(url: url, name: name, size: size, lastModified: lastModified))
                }
            }
        }
        return documents
    }
    
    class func save(name: String, content: String) {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsURL.appendingPathComponent(name)
        try? content.write(to: url, atomically: true, encoding: .utf8)
    }
    
    class func delete(url: URL) {
        try? FileManager.default.removeItem(at: url)
    }
}

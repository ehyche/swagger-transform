//
//  STPaths.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/22/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STPaths: STVendorExtensible {
    var paths: [String: STPathItem]?

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STNonExtensionKey.self)

        let pathKeys = container.allKeys
        if !pathKeys.isEmpty {
            var tmpPaths = [String:STPathItem]()
            for pathKey in pathKeys {
                let path = try container.decode(STPathItem.self, forKey: pathKey)
                tmpPaths[pathKey.stringValue] = path
            }
            paths = tmpPaths
        }

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {

        if let paths = paths, !paths.isEmpty {
            var container = encoder.container(keyedBy: STNonExtensionKey.self)
            for (pathKey, pathItem) in paths {
                if let nonExtensionKey = STNonExtensionKey(stringValue: pathKey) {
                    try container.encode(pathItem, forKey: nonExtensionKey)
                }
            }
        }

        try super.encode(to: encoder)
    }

}

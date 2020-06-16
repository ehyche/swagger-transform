//
//  STVendorExtensible.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STVendorExtensible: Codable {

    var vendorExtensions: [String: STExtensionValue]?

    // Decodable methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STExtensionKey.self)

        let extensionKeys = container.allKeys
        if !extensionKeys.isEmpty {
            var tmpVendorExtensions = [String: STExtensionValue]()
            for extensionKey in extensionKeys {
                let extensionValue = try container.decode(STExtensionValue.self, forKey: extensionKey)
                tmpVendorExtensions[extensionKey.stringValue] = extensionValue
            }
            vendorExtensions = tmpVendorExtensions
        }
    }

    // Encodable methods

    func encode(to encoder: Encoder) throws {
        if let vendorExtensions = vendorExtensions {
            var container = encoder.container(keyedBy: STExtensionKey.self)
            for (extensionKeyString, extensionValue) in vendorExtensions {
                if let extensionKey = STExtensionKey(stringValue: extensionKeyString) {
                    try container.encode(extensionValue, forKey: extensionKey)
                }
            }
        }
    }

}



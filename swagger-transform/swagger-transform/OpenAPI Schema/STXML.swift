//
//  STXML.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STXML: STVendorExtensible {
    var name: String?
    var namespace: String?
    var prefix: String?
    var attribute: Bool?
    var wrapped: Bool?

    enum STXMLKeys: String, CodingKey {
        case name
        case namespace
        case prefix
        case attribute
        case wrapped
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STXMLKeys.self)

        name = try container.decodeIfPresent(String.self, forKey: .name)
        namespace = try container.decodeIfPresent(String.self, forKey: .namespace)
        prefix = try container.decodeIfPresent(String.self, forKey: .prefix)
        attribute = try container.decodeIfPresent(Bool.self, forKey: .attribute)
        wrapped = try container.decodeIfPresent(Bool.self, forKey: .wrapped)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STXMLKeys.self)

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(namespace, forKey: .namespace)
        try container.encodeIfPresent(prefix, forKey: .prefix)
        try container.encodeIfPresent(attribute, forKey: .attribute)
        try container.encodeIfPresent(wrapped, forKey: .wrapped)

        try super.encode(to: encoder)
    }

}

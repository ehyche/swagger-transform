//
//  STTag.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STTag: STVendorExtensible {
    var name: String
    var description: String?
    var externalDocs: STExternalDocumentation?

    enum STTagKeys: String, CodingKey {
        case name
        case description
        case externalDocs
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STTagKeys.self)

        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        externalDocs = try container.decodeIfPresent(STExternalDocumentation.self, forKey: .externalDocs)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STTagKeys.self)

        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(externalDocs, forKey: .externalDocs)

        try super.encode(to: encoder)
    }

}

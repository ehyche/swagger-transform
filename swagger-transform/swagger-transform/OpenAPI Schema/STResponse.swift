//
//  STResponse.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STResponse: STVendorExtensible {
    var description: String
    var schema: STSchema?
    var headers: [String: STHeader]?
    var examples: [String: STExtensionValue]?

    enum STResponseKeys: String, CodingKey {
        case description
        case schema
        case headers
        case examples
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STResponseKeys.self)

        description = try container.decode(String.self, forKey: .description)
        schema = try container.decodeIfPresent(STSchema.self, forKey: .schema)
        headers = try container.decodeIfPresent([String: STHeader].self, forKey: .headers)
        examples = try container.decodeIfPresent([String: STExtensionValue].self, forKey: .examples)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STResponseKeys.self)

        try container.encode(description, forKey: .description)
        try container.encodeIfPresent(schema, forKey: .schema)
        try container.encodeIfPresent(headers, forKey: .headers)
        try container.encodeIfPresent(examples, forKey: .examples)

        try super.encode(to: encoder)
    }

}

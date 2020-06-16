//
//  STExternalDocumentation.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STExternalDocumentation: STVendorExtensible {
    var description: String?
    var url: String

    enum STExternalDocumentationKeys: String, CodingKey {
        case description
        case url
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STExternalDocumentationKeys.self)

        description = try container.decodeIfPresent(String.self, forKey: .description)
        url = try container.decode(String.self, forKey: .url)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STExternalDocumentationKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(url, forKey: .url)

        try super.encode(to: encoder)
    }

}

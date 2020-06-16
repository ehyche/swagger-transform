//
//  STContact.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STContact: STVendorExtensible {
    var name: String?
    var url: String?
    var email: String?

    enum STContactKeys: String, CodingKey {
        case name
        case url
        case email
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STContactKeys.self)

        name = try container.decodeIfPresent(String.self, forKey: .name)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        email = try container.decodeIfPresent(String.self, forKey: .email)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STContactKeys.self)

        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(email, forKey: .email)

        try super.encode(to: encoder)
    }

}

//
//  STLicense.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STLicense: STVendorExtensible {
    var name: String
    var url: String?

    enum STLicenseKeys: String, CodingKey {
        case name
        case url
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STLicenseKeys.self)

        name = try container.decode(String.self, forKey: .name)
        url = try container.decodeIfPresent(String.self, forKey: .url)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STLicenseKeys.self)

        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)

        try super.encode(to: encoder)
    }

}

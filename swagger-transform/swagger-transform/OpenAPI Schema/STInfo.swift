//
//  STInfo.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STInfo: STVendorExtensible {
    var title: String
    var description: String?
    var termsOfService: String?
    var contact: STContact?
    var license: STLicense?
    var version: String

    enum STInfoKeys: String, CodingKey {
        case title
        case description
        case termsOfService
        case contact
        case license
        case version
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STInfoKeys.self)

        title = try container.decode(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        termsOfService = try container.decodeIfPresent(String.self, forKey: .termsOfService)
        contact = try container.decodeIfPresent(STContact.self, forKey: .contact)
        license = try container.decodeIfPresent(STLicense.self, forKey: .license)
        version = try container.decode(String.self, forKey: .version)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STInfoKeys.self)

        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(termsOfService, forKey: .termsOfService)
        try container.encodeIfPresent(contact, forKey: .contact)
        try container.encodeIfPresent(license, forKey: .license)
        try container.encode(version, forKey: .version)

        try super.encode(to: encoder)
    }


}

//
//  STSecurityScheme.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STSecurityScheme: STVendorExtensible {
    var type: STSecuritySchemeType
    var description: String?
    var name: String
    var location: STSecuritySchemeLocation
    var flow: STSecuritySchemeFlow?
    var authorizationUrl: String
    var tokenUrl: String
    var scopes: [String: String]

    enum STSecuritySchemeKeys: String, CodingKey {
        case type
        case description
        case name
        case location = "in"
        case flow
        case authorizationUrl
        case tokenUrl
        case scopes
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STSecuritySchemeKeys.self)

        type = try container.decode(STSecuritySchemeType.self, forKey: .type)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(STSecuritySchemeLocation.self, forKey: .location)
        flow = try container.decode(STSecuritySchemeFlow.self, forKey: .flow)
        authorizationUrl = try container.decode(String.self, forKey: .authorizationUrl)
        tokenUrl = try container.decode(String.self, forKey: .tokenUrl)
        scopes = try container.decode([String: String].self, forKey: .scopes)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STSecuritySchemeKeys.self)

        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(flow, forKey: .flow)
        try container.encode(authorizationUrl, forKey: .authorizationUrl)
        try container.encode(tokenUrl, forKey: .tokenUrl)
        try container.encode(scopes, forKey: .scopes)

        try super.encode(to: encoder)
    }

}

//
//  STParameter.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/16/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STParameter: STValidatory {
    var name: String
    var location: STParameterLocation
    var description: String?
    var required: Bool?
    var schema: STSchema?
    var allowEmptyValue: Bool?
    var collectionFormat: STCollectionFormatWithMulti?

    enum STParameterKeys: String, CodingKey {
        case name
        case location = "in"
        case description
        case required
        case schema
        case allowEmptyValue
        case collectionFormat
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STParameterKeys.self)

        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(STParameterLocation.self, forKey: .location)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        required = try container.decodeIfPresent(Bool.self, forKey: .required)
        schema = try container.decodeIfPresent(STSchema.self, forKey: .schema)
        allowEmptyValue = try container.decodeIfPresent(Bool.self, forKey: .allowEmptyValue)
        collectionFormat = try container.decodeIfPresent(STCollectionFormatWithMulti.self, forKey: .collectionFormat)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STParameterKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(required, forKey: .required)
        try container.encodeIfPresent(schema, forKey: .schema)
        try container.encodeIfPresent(allowEmptyValue, forKey: .allowEmptyValue)
        try container.encodeIfPresent(collectionFormat, forKey: .collectionFormat)

        try super.encode(to: encoder)
    }

}

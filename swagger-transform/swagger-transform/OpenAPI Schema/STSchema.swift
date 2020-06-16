//
//  STSchema.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STSchema: STValidatory {
    var ref: String?
    var title: String?
    var description: String?
    var maxProperties: Int?
    var minProperties: Int?
    var required: [String]?
    var allOf: [STSchema]?
    var discriminator: String?
    var readOnly: Bool?
    var xml: STXML?
    var externalDocs: STExternalDocumentation?
    var example: STExtensionValue?
    var properties: [String: STSchema]?
    var additionalProperties: STSchema?

    enum STSchemaKeys: String, CodingKey {
        case ref = "$ref"
        case title
        case description
        case maxProperties
        case minProperties
        case required
        case allOf
        case discriminator
        case readOnly
        case xml
        case externalDocs
        case example
        case properties
        case additionalProperties
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STSchemaKeys.self)

        ref = try container.decodeIfPresent(String.self, forKey: .ref)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        maxProperties = try container.decodeIfPresent(Int.self, forKey: .maxProperties)
        minProperties = try container.decodeIfPresent(Int.self, forKey: .minProperties)
        required = try container.decodeIfPresent([String].self, forKey: .required)
        allOf = try container.decodeIfPresent([STSchema].self, forKey: .allOf)
        discriminator = try container.decodeIfPresent(String.self, forKey: .discriminator)
        readOnly = try container.decodeIfPresent(Bool.self, forKey: .readOnly)
        xml = try container.decodeIfPresent(STXML.self, forKey: .xml)
        externalDocs = try container.decodeIfPresent(STExternalDocumentation.self, forKey: .externalDocs)
        example = try container.decodeIfPresent(STExtensionValue.self, forKey: .example)
        additionalProperties = try container.decodeIfPresent(STSchema.self, forKey: .additionalProperties)

        if container.contains(.properties) {
            var tmpProperties = [String:STSchema]()
            let propertiesContainer = try container.nestedContainer(keyedBy: String.self, forKey: .properties)
            for propertyKey in propertiesContainer.allKeys {
                let property = try propertiesContainer.decode(STSchema.self, forKey: propertyKey)
                tmpProperties[propertyKey] = property
            }
            properties = tmpProperties
        }

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STSchemaKeys.self)

        try container.encodeIfPresent(ref, forKey: .ref)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(maxProperties, forKey: .maxProperties)
        try container.encodeIfPresent(minProperties, forKey: .minProperties)
        try container.encodeIfPresent(required, forKey: .required)
        try container.encodeIfPresent(allOf, forKey: .allOf)
        try container.encodeIfPresent(discriminator, forKey: .discriminator)
        try container.encodeIfPresent(readOnly, forKey: .readOnly)
        try container.encodeIfPresent(xml, forKey: .xml)
        try container.encodeIfPresent(externalDocs, forKey: .externalDocs)
        try container.encodeIfPresent(example, forKey: .example)
        try container.encodeIfPresent(properties, forKey: .properties)
        try container.encodeIfPresent(additionalProperties, forKey: .additionalProperties)

        try super.encode(to: encoder)
    }

}

//
//  STValidatory.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STValidatory: STVendorExtensible {
    var type: STType?
    var format: String?
    var maximum: Double?
    var exclusiveMaximum: Bool?
    var minimum: Double?
    var exclusiveMinimum: Bool?
    var maxLength: Int?
    var minLength: Int?
    var pattern: String?
    var maxItems: Int?
    var minItems: Int?
    var uniqueItems: Bool?
    var enums: [STExtensionValue]?
    var multipleOf: Double?
    var items: STItems?
    var defaultValue: STExtensionValue?

    enum STValidatoryKeys: String, CodingKey {
        case type
        case format
        case maximum
        case exclusiveMaximum
        case minimum
        case exclusiveMinimum
        case maxLength
        case minLength
        case pattern
        case maxItems
        case minItems
        case uniqueItems
        case enums = "enum"
        case multipleOf
        case items
        case defaultValue = "default"
    }

    // Decodable protocol

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STValidatoryKeys.self)

        type = try container.decodeIfPresent(STType.self, forKey: .type)
        format = try container.decodeIfPresent(String.self, forKey: .format)
        maximum = try container.decodeIfPresent(Double.self, forKey: .maximum)
        exclusiveMaximum = try container.decodeIfPresent(Bool.self, forKey: .exclusiveMaximum)
        minimum = try container.decodeIfPresent(Double.self, forKey: .minimum)
        exclusiveMinimum = try container.decodeIfPresent(Bool.self, forKey: .exclusiveMinimum)
        maxLength = try container.decodeIfPresent(Int.self, forKey: .maxLength)
        minLength = try container.decodeIfPresent(Int.self, forKey: .minLength)
        pattern = try container.decodeIfPresent(String.self, forKey: .pattern)
        maxItems = try container.decodeIfPresent(Int.self, forKey: .maxItems)
        minItems = try container.decodeIfPresent(Int.self, forKey: .minItems)
        uniqueItems = try container.decodeIfPresent(Bool.self, forKey: .uniqueItems)
        multipleOf = try container.decodeIfPresent(Double.self, forKey: .multipleOf)
        items = try container.decodeIfPresent(STItems.self, forKey: .items)
        defaultValue = try container.decodeIfPresent(STExtensionValue.self, forKey: .defaultValue)

        // Decode enum
        if container.contains(.enums) {
            var tmpEnums = [STExtensionValue]()
            var enumsContainer = try container.nestedUnkeyedContainer(forKey: .enums)
            while (!enumsContainer.isAtEnd) {
                let enumValue = try enumsContainer.decode(STExtensionValue.self)
                tmpEnums.append(enumValue)
            }
            enums = tmpEnums
        }

        try super.init(from: decoder)
    }

    // Encodable protocol

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STValidatoryKeys.self)

        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(maximum, forKey: .maximum)
        try container.encodeIfPresent(exclusiveMaximum, forKey: .exclusiveMaximum)
        try container.encodeIfPresent(minimum, forKey: .minimum)
        try container.encodeIfPresent(exclusiveMinimum, forKey: .exclusiveMinimum)
        try container.encodeIfPresent(maxLength, forKey: .maxLength)
        try container.encodeIfPresent(minLength, forKey: .minLength)
        try container.encodeIfPresent(pattern, forKey: .pattern)
        try container.encodeIfPresent(maxItems, forKey: .maxItems)
        try container.encodeIfPresent(minItems, forKey: .minItems)
        try container.encodeIfPresent(uniqueItems, forKey: .uniqueItems)
        try container.encodeIfPresent(multipleOf, forKey: .multipleOf)
        try container.encodeIfPresent(items, forKey: .items)
        try container.encodeIfPresent(defaultValue, forKey: .defaultValue)

        // Encode enums
        if let enums = enums, !enums.isEmpty {
            var enumsContainer = container.nestedUnkeyedContainer(forKey: .enums)
            for enumValue in enums {
                try enumsContainer.encode(enumValue)
            }
        }

        try super.encode(to: encoder)
    }

}


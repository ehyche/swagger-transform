//
//  STExtensionValue.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/16/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

enum STExtensionValue: Codable {
    case null
    case integer(Int)
    case number(Double)
    case boolean(Bool)
    case string(String)
    case array([STExtensionValue])
    case object([String:STExtensionValue])

    // Decodable protocol methods

    init(from decoder: Decoder) throws {
        let singleValueContainer = try decoder.singleValueContainer()

        // First try to decode null
        guard !singleValueContainer.decodeNil() else {
            self = .null
            return
        }

        // Now try to decode a boolean
        do {
            let boolValue = try singleValueContainer.decode(Bool.self)
            self = .boolean(boolValue)
            return
        } catch {
        }

        // Now try to decode an integer
        do {
            let intValue = try singleValueContainer.decode(Int.self)
            self = .integer(intValue)
            return
        } catch {
        }

        // Now try to decode a number
        do {
            let doubleValue = try singleValueContainer.decode(Double.self)
            self = .number(doubleValue)
            return
        } catch {
        }

        // Now try to decode a string. If this fails, then we throw
        let stringValue = try singleValueContainer.decode(String.self)
        self = .string(stringValue)
    }

    // Encodable protocol methods

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
            case .null:
                try container.encodeNil()
            case .integer(let intValue):
                try container.encode(intValue)
            case .number(let doubleValue):
                try container.encode(doubleValue)
            case .boolean(let boolValue):
                try container.encode(boolValue)
            case .string(let stringValue):
                try container.encode(stringValue)
            case .array(let arrayValue):
                try container.encode(arrayValue)
            case .object(let objectValue):
                try container.encode(objectValue)
        }
    }

}

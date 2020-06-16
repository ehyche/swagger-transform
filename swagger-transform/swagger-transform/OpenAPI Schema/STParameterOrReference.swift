//
//  STParameterOrReference.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

enum STParameterOrReference: Codable {
    case parameter(STParameter)
    case reference(STReference)

    enum STParameterOrReferenceKeys: String, CodingKey {
        case ref = "$ref"
    }

    // Decodable protocol methods

    init(from decoder: Decoder) throws {
        // Parameter objects have required "name" and "in" properties.
        // Reference objects have a required "$ref" property
        // So we check to see if this has a "$ref" property, and if so,
        // we decode it as a Reference. Otherwise, we decode it as a Parameter.
        let container = try decoder.container(keyedBy: STParameterOrReferenceKeys.self)
        if container.allKeys.isEmpty {
            // There is no "$ref" key, so this must be a Response
            let response = try STParameter(from: decoder)
            self = .parameter(response)
        } else {
            // There is a "$ref" key, so this must be a Reference
            let reference = try STReference(from: decoder)
            self = .reference(reference)
        }
    }

    // Encodable protocol methods

    func encode(to encoder: Encoder) throws {
        switch self {
            case .reference(let reference):
                try reference.encode(to: encoder)
            case .parameter(let parameter):
                try parameter.encode(to: encoder)
        }
    }

}

//
//  STResponseOrReference.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

enum STResponseOrReference: Codable {
    case response(STResponse)
    case reference(STReference)

    enum STResponseOrReferenceKeys: String, CodingKey {
        case ref = "$ref"
    }

    // Decodable protocol methods

    init(from decoder: Decoder) throws {
        // Response objects have a required "description" property
        // Reference objects have a required "$ref" property
        // So we check to see if this has a "$ref" property, and if so,
        // we decode it as a Reference. Otherwise, we decode it as a Response.
        let container = try decoder.container(keyedBy: STResponseOrReferenceKeys.self)
        if container.allKeys.isEmpty {
            // There is no "$ref" key, so this must be a Response
            let response = try STResponse(from: decoder)
            self = .response(response)
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
            case .response(let response):
                try response.encode(to: encoder)
        }
    }

}

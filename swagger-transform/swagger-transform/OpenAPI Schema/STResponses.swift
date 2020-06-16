//
//  STResponses.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/22/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STResponses: STVendorExtensible {
    var defaultResponse: STResponseOrReference?
    var responses: [STHTTPStatusCodeKey: STResponseOrReference]?

    enum STResponsesKeys: String, CodingKey {
        case defaultResponse = "default"
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STResponsesKeys.self)
        defaultResponse = try container.decodeIfPresent(STResponseOrReference.self, forKey: .defaultResponse)

        // Decode the responses keyed by HTTP status code
        let responsesContainer = try decoder.container(keyedBy: STHTTPStatusCodeKey.self)
        let responsesKeys = responsesContainer.allKeys
        if !responsesKeys.isEmpty {
            var tmpResponses = [STHTTPStatusCodeKey: STResponseOrReference]()
            for responseKey in responsesKeys {
                let response = try responsesContainer.decode(STResponseOrReference.self, forKey: responseKey)
                tmpResponses[responseKey] = response
            }
            responses = tmpResponses
        }

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STResponsesKeys.self)
        try container.encodeIfPresent(defaultResponse, forKey: .defaultResponse)

        if let responses = responses, !responses.isEmpty {
            var responsesContainer = encoder.container(keyedBy: STHTTPStatusCodeKey.self)
            for (responseKey, response) in responses {
                try responsesContainer.encode(response, forKey: responseKey)
            }
        }

        try super.encode(to: encoder)
    }
}

//
//  STOperation.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STOperation: STVendorExtensible {
    var tags: [String]?
    var summary: String?
    var description: String?
    var externalDocs: STExternalDocumentation?
    var operationId: String?
    var consumes: [String]?
    var produces: [String]?
//    var parameters: [STParameterOrReference]?
    var parameters: [STParameter]?
    var responses: STResponses
    var schemes: [String]?
    var deprecated: Bool?
    var security: [[String: [String]]]?

    enum STOperationKeys: String, CodingKey {
        case tags
        case summary
        case description
        case externalDocs
        case operationId
        case consumes
        case produces
        case parameters
        case responses
        case schemes
        case deprecated
        case security
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STOperationKeys.self)

        tags = try container.decodeIfPresent([String].self, forKey: .tags)
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        externalDocs = try container.decodeIfPresent(STExternalDocumentation.self, forKey: .externalDocs)
        operationId = try container.decodeIfPresent(String.self, forKey: .operationId)
        consumes = try container.decodeIfPresent([String].self, forKey: .consumes)
        produces = try container.decodeIfPresent([String].self, forKey: .produces)
        responses = try container.decode(STResponses.self, forKey: .responses)
        schemes = try container.decodeIfPresent([String].self, forKey: .schemes)
        deprecated = try container.decodeIfPresent(Bool.self, forKey: .deprecated)
        security = try container.decodeIfPresent([[String: [String]]].self, forKey: .security)

        // Decode parameters
        if container.contains(.parameters) {
            var tmpParameters = [STParameter]()
            var parametersContainer = try container.nestedUnkeyedContainer(forKey: .parameters)
            while (!parametersContainer.isAtEnd) {
                let parameter = try parametersContainer.decode(STParameter.self)
                tmpParameters.append(parameter)
            }
            parameters = tmpParameters
        }

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STOperationKeys.self)

        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(summary, forKey: .summary)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(externalDocs, forKey: .externalDocs)
        try container.encodeIfPresent(operationId, forKey: .operationId)
        try container.encodeIfPresent(consumes, forKey: .consumes)
        try container.encodeIfPresent(produces, forKey: .produces)
        try container.encodeIfPresent(responses, forKey: .responses)
        try container.encodeIfPresent(schemes, forKey: .schemes)
        try container.encodeIfPresent(deprecated, forKey: .deprecated)
        try container.encodeIfPresent(security, forKey: .security)

        if let parameters = parameters, !parameters.isEmpty {
            var parametersContainer = container.nestedUnkeyedContainer(forKey: .parameters)
            for parameter in parameters {
                try parametersContainer.encode(parameter)
            }
        }

        try super.encode(to: encoder)
    }

}

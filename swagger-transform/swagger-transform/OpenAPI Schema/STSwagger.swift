//
//  STSwagger.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STSwagger: STVendorExtensible {
    var swagger: String
    var info: STInfo
    var host: String?
    var basePath: String?
    var schemes: [String]?
    var consumes: [String]?
    var produces: [String]?
    var paths: STPaths
    var definitions: [String:STSchema]?
    var parameters: [String:STParameter]?
    var responses: [String:STResponse]?
    var securityDefinitions: [String: STSecurityScheme]?
    var security: [[String: [String]]]?
    var tags: [STTag]?
    var externalDocs: STExternalDocumentation?

    enum STSwaggerKeys: String, CodingKey {
        case swagger
        case info
        case host
        case basePath
        case schemes
        case consumes
        case produces
        case paths
        case definitions
        case parameters
        case responses
        case securityDefinitions
        case security
        case tags
        case externalDocs
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STSwaggerKeys.self)

        swagger = try container.decode(String.self, forKey: .swagger)
        info = try container.decode(STInfo.self, forKey: .info)
        host = try container.decodeIfPresent(String.self, forKey: .host)
        basePath = try container.decodeIfPresent(String.self, forKey: .basePath)
        schemes = try container.decodeIfPresent([String].self, forKey: .schemes)
        consumes = try container.decodeIfPresent([String].self, forKey: .consumes)
        produces = try container.decodeIfPresent([String].self, forKey: .produces)
        paths = try container.decode(STPaths.self, forKey: .paths)
        definitions = try container.decodeIfPresent([String:STSchema].self, forKey: .definitions)
        parameters = try container.decodeIfPresent([String:STParameter].self, forKey: .parameters)
        responses = try container.decodeIfPresent([String:STResponse].self, forKey: .responses)
        securityDefinitions = try container.decodeIfPresent([String:STSecurityScheme].self, forKey: .securityDefinitions)
        security = try container.decodeIfPresent([[String: [String]]].self, forKey: .security)
        tags = try container.decodeIfPresent([STTag].self, forKey: .tags)
        externalDocs = try container.decodeIfPresent(STExternalDocumentation.self, forKey: .externalDocs)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STSwaggerKeys.self)

        try container.encode(swagger, forKey: .swagger)
        try container.encode(info, forKey: .info)
        try container.encodeIfPresent(host, forKey: .host)
        try container.encodeIfPresent(basePath, forKey: .basePath)
        try container.encodeIfPresent(schemes, forKey: .schemes)
        try container.encodeIfPresent(consumes, forKey: .consumes)
        try container.encodeIfPresent(produces, forKey: .produces)
        try container.encode(paths, forKey: .paths)
        try container.encodeIfPresent(definitions, forKey: .definitions)
        try container.encodeIfPresent(parameters, forKey: .parameters)
        try container.encodeIfPresent(responses, forKey: .responses)
        try container.encodeIfPresent(securityDefinitions, forKey: .securityDefinitions)
        try container.encodeIfPresent(security, forKey: .security)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(externalDocs, forKey: .externalDocs)

        try super.encode(to: encoder)
    }

}

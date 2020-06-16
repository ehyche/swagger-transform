//
//  STPathItem.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/16/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STPathItem: STVendorExtensible {
    var ref: String?
    var get: STOperation?
    var put: STOperation?
    var post: STOperation?
    var delete: STOperation?
    var head: STOperation?
    var patch: STOperation?
    var parameters: [STParameterOrReference]?

    enum STPathItemKeys: String, CodingKey {
        case ref = "$ref"
        case get
        case put
        case post
        case delete
        case head
        case patch
        case parameters
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STPathItemKeys.self)

        ref = try container.decodeIfPresent(String.self, forKey: .ref)
        get = try container.decodeIfPresent(STOperation.self, forKey: .get)
        put = try container.decodeIfPresent(STOperation.self, forKey: .put)
        post = try container.decodeIfPresent(STOperation.self, forKey: .post)
        delete = try container.decodeIfPresent(STOperation.self, forKey: .delete)
        head = try container.decodeIfPresent(STOperation.self, forKey: .head)
        patch = try container.decodeIfPresent(STOperation.self, forKey: .patch)
        parameters = try container.decodeIfPresent([STParameterOrReference].self, forKey: .parameters)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STPathItemKeys.self)

        try container.encodeIfPresent(ref, forKey: .ref)
        try container.encodeIfPresent(get, forKey: .get)
        try container.encodeIfPresent(put, forKey: .put)
        try container.encodeIfPresent(post, forKey: .post)
        try container.encodeIfPresent(delete, forKey: .delete)
        try container.encodeIfPresent(head, forKey: .head)
        try container.encodeIfPresent(patch, forKey: .patch)
        try container.encodeIfPresent(parameters, forKey: .parameters)

        try super.encode(to: encoder)
    }

}

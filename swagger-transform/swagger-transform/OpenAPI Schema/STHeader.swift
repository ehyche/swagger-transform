//
//  STHeader.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STHeader: STValidatory {
    var description: String?
    var collectionFormat: STCollectionFormat?

    enum STHeaderKeys: String, CodingKey {
        case description
        case collectionFormat
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STHeaderKeys.self)

        description = try container.decodeIfPresent(String.self, forKey: .description)
        collectionFormat = try container.decodeIfPresent(STCollectionFormat.self, forKey: .collectionFormat)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STHeaderKeys.self)

        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(collectionFormat, forKey: .collectionFormat)

        try super.encode(to: encoder)
    }

}

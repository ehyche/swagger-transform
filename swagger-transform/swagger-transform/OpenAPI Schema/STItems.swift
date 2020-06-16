//
//  STItems.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STItems: STValidatory {
    var collectionFormat: STCollectionFormat?

    enum STItemsKeys: String, CodingKey {
        case collectionFormat
    }

    // Decodable protocol methods

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: STItemsKeys.self)

        collectionFormat = try container.decodeIfPresent(STCollectionFormat.self, forKey: .collectionFormat)

        try super.init(from: decoder)
    }

    // Encodable protocol methods

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: STItemsKeys.self)

        try container.encodeIfPresent(collectionFormat, forKey: .collectionFormat)

        try super.encode(to: encoder)
    }

}

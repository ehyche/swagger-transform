//
//  STReference.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STReference: Codable {
    var ref: String

    enum STReferenceKeys: String, CodingKey {
        case ref = "$ref"
    }
}

//
//  STParameterLocation.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

enum STParameterLocation: String, Codable {
    case query
    case header
    case path
    case formData
    case body
}

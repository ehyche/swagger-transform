//
//  STSecuritySchemeType.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

enum STSecuritySchemeType: String, Codable {
    case basic
    case apiKey
    case oauth2
}

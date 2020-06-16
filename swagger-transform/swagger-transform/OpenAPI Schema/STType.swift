//
//  STType.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/17/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

enum STType: String, Codable {
    case string
    case number
    case integer
    case boolean
    case array
    case file
    case null
    case object
}

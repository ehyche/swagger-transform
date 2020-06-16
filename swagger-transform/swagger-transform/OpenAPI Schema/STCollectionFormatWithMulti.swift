//
//  STCollectionFormatWithMulti.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

enum STCollectionFormatWithMulti: String, Codable {
    case csv
    case ssv
    case tsv
    case pipes
    case multi
}

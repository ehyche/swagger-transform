//
//  main.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/15/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

let schemaFileName = CommandLine.arguments[1]

if let fileData = FileManager.default.contents(atPath: schemaFileName) {
    let decodeResult = STCodableHelper.decode(STSwagger.self, from: fileData)
    if let swagger = decodeResult.decodable {
        print("Successfully decoded swagger object: \(swagger)")
    } else if let error = decodeResult.error {
        print("Error decoding swagger object = \(error)")
    }
} else {
    print("Could not open file at \(schemaFileName)")
}


//
//  STNonExtensionKey.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/23/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

struct STNonExtensionKey: CodingKey {

    private let key: String

    public var stringValue: String {
        return key
    }

    public init?(stringValue: String) {
        guard !stringValue.hasPrefix("x-") else {
            return nil
        }

        key = stringValue
    }

    public var intValue: Int? {
        return nil
    }

    public init?(intValue: Int) {
        return nil
    }

}

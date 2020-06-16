//
//  String+Extensions.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/16/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

extension String: CodingKey {

    public var stringValue: String {
        return self
    }

    public init?(stringValue: String) {
        self.init(stringLiteral: stringValue)
    }

    public var intValue: Int? {
        return nil
    }

    public init?(intValue: Int) {
        return nil
    }

}

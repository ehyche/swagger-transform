//
//  NSNumber+Extensions.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/21/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

extension NSNumber {

    var objCTypeString: String {
        get {
            return String(cString: objCType)
        }
    }

    func isObjCTypeIn(typeEncodings: [String]) -> Bool {
        return typeEncodings.contains(objCTypeString)
    }

    var isBooleanObjCType: Bool {
        get {
            // See type encodings here:
            // https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
            return isObjCTypeIn(typeEncodings: ["c", "C"])
        }
    }

    var isIntegerObjCType: Bool {
        get {
            // See type encodings here:
            // https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
            return isObjCTypeIn(typeEncodings: ["q", "i", "s", "l", "Q", "I", "S", "L"])
        }
    }

    var isNumberObjCType: Bool {
        get {
            // See type encodings here:
            // https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
            return isObjCTypeIn(typeEncodings: ["d", "f", "q", "i", "s", "l", "Q", "I", "S", "L"])
        }
    }

}

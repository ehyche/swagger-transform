//
//  STCodableHelper.swift
//  swagger-transform
//
//  Created by Eric Hyche on 10/16/17.
//  Copyright © 2017 HeirPlay Software. All rights reserved.
//

import Foundation

class STCodableHelper {

    class func decode<T>(_ type: T.Type,
                         from data: Data,
//                         dateStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
//                         dataStrategy: JSONDecoder.DataDecodingStrategy = .base64,
//                         floatStrategy: JSONDecoder.NonConformingFloatDecodingStrategy = .`throw`,
                         dateStrategy: KSONDecoder.DateDecodingStrategy = .deferredToDate,
                         dataStrategy: KSONDecoder.DataDecodingStrategy = .base64,
                         floatStrategy: KSONDecoder.NonConformingFloatDecodingStrategy = .`throw`,
                         userInfo: [CodingUserInfoKey : Any] = [CodingUserInfoKey : Any]()) -> (decodable: T?, error: Error?) where T : Decodable {
        var returnedDecodable: T? = nil
        var returnedError: Error? = nil

//        let decoder = JSONDecoder()
        let decoder = KSONDecoder()
        decoder.dateDecodingStrategy = dateStrategy
        decoder.dataDecodingStrategy = dataStrategy
        decoder.nonConformingFloatDecodingStrategy = floatStrategy
        decoder.userInfo = userInfo

        do {
            returnedDecodable = try decoder.decode(type, from: data)
        } catch {
            returnedError = error
        }

        return (returnedDecodable, returnedError)
    }

    class func encode<T>(_ value: T,
//                         outputFormatting: JSONEncoder.OutputFormatting = [.sortedKeys, .prettyPrinted],
//                         dateStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
//                         dataStrategy: JSONEncoder.DataEncodingStrategy = .base64,
//                         floatStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .`throw`,
                         outputFormatting: KSONEncoder.OutputFormatting = [.sortedKeys, .prettyPrinted],
                         dateStrategy: KSONEncoder.DateEncodingStrategy = .deferredToDate,
                         dataStrategy: KSONEncoder.DataEncodingStrategy = .base64,
                         floatStrategy: KSONEncoder.NonConformingFloatEncodingStrategy = .`throw`,
                         userInfo: [CodingUserInfoKey : Any] = [CodingUserInfoKey : Any]()) -> (data: Data?, error: Error?) where T : Encodable {
        var returnedData: Data? = nil
        var returnedError: Error? = nil

//        let encoder = JSONEncoder()
        let encoder = KSONEncoder()
        encoder.outputFormatting = outputFormatting
        encoder.dateEncodingStrategy = dateStrategy
        encoder.dataEncodingStrategy = dataStrategy
        encoder.nonConformingFloatEncodingStrategy = floatStrategy
        encoder.userInfo = userInfo

        do {
            returnedData = try encoder.encode(value)
        } catch {
            returnedError = error
        }

        return (returnedData, returnedError)
    }

}

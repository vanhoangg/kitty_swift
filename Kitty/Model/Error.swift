//
//  Error.swift
//  Kitty
//
//  Created by hoang.dinh on 5/11/23.
//

import Foundation
enum KTError: Error, Equatable {
    case error(String)
    case errorRequestWithCode(Int, String?)
    case errorURL
    case errorMalformedURL
    case errorDataNotExist
    case errorDecodedData
    case errorUnknown
    case errorEmptyData

    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorRequestWithCode(let code, let message):
            return "Error \(code): \(message ?? "")"
        case .errorURL:
            return "URL String is error."
        case .errorMalformedURL:
            return "URL String is malformed."
        case .errorDataNotExist:
            return "Database is not exist."
        case .errorDecodedData:
            return "Can not decode data."
        case .errorUnknown:
            return "Unknown error"
        case .errorEmptyData:
            return "Empty data"
        }
    }
}

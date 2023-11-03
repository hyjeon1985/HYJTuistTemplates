//
//  CommonError.swift
//  Common
//
//  Created by Hoyeol Jeon on 10/25/23.
//

import Foundation


public enum CommonError: CustomError {
    
    case unknown
    case poorNetwork
    case fileNotFound(filePath: String)
    case permissionRequired(permissionName: String)
    case invalidInput(description: String)

    public var errorDomain: String {
        return "com.aiforpet.sdk.remoteconsult.common.error"
    }

    public var errorCode: Int {
        switch self {
        case .unknown:
            return 1000
        case .poorNetwork:
            return 1001
        case .fileNotFound:
            return 1002
        case .permissionRequired:
            return 1003
        case .invalidInput:
            return 1004
        }
    }

    public var errorDescription: String {
        switch self {
        case .unknown:
            return "Unknown error occurred."
        case .poorNetwork:
            return "Network error occurred."
        case .fileNotFound(let filePath):
            return "File not found: \(filePath)"
        case .permissionRequired(let permissionName):
            return "Permission denied: \(permissionName)"
        case .invalidInput(let description):
            return "Invalid input: \(description)"
        }
    }
}

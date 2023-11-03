//
//  Data+Ext.swift
//  Common
//
//  Created by Hoyeol Jeon on 10/24/23.
//

import Foundation

public extension Data {
    func toHexString() -> String {
        return self.map { String(format: "%02x", $0) }.joined()
    }
}

//
//  CustomError.swift
//  Common
//
//  Created by Hoyeol Jeon on 10/25/23.
//

import Foundation

public protocol CustomError: Error {
    
    var errorDomain: String { get } // 에러 도메인
    
    var errorCode: Int { get }      // 에러 코드
    
    var errorDescription: String { get } // 에러 설명
}

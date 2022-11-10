//
//  CustomError.swift
//  RMApp
//
//  Created by westin on 2022/11/9.
//

import Foundation

enum CustomError {
    case noResponse, noData, parseError
}

// error handleing defination here
extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noResponse: return "Well, Internet Connection Error";
        case .noData: return "Well, weird thing happns";
        case .parseError: return "Well, Data parse error";
        }
    }
}

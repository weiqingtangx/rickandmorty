//
//  ViewState.swift
//  RMApp
//
//  Created by westin on 2022/11/10.
//

import Foundation

//depands on state show different ui
enum ViewState {
    case idle
    case loading
    case success
    case error(Error)
}

//
//  Result.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/1/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(data: T)
    case error(error: Error)
}

//
//  UseCase.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/4/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

protocol UseCase {
    
    associatedtype T
    
    func execute(params: T)
}

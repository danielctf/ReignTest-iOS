//
//  CompletionUseCase.swift
//  ReignTest-iOS
//
//  Created by Daniel Santamaria on 8/11/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation

protocol CompletionUseCase {
    
    func execute(onCompletion: @escaping () -> Void)
}

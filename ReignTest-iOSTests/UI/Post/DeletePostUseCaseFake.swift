//
//  DeletePostUseCaseFake.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/14/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
@testable import ReignTest_iOS

class DeletePostUseCaseFake: DeletePostUseCaseProtocol {
    
    var isCalled = false
    
    func execute(post: Post) {
        isCalled = true
    }
}

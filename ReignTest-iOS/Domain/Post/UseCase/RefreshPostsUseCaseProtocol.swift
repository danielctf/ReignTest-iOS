//
//  RefreshPostsUseCaseProtocol.swift
//  ReignTest-iOS
//
//  Created by Daniel Santamaria on 8/14/20.
//  Copyright © 2020 Reign. All rights reserved.
//

protocol RefreshPostsUseCaseProtocol {
    
    func execute(onCompletion: @escaping () -> Void)
}

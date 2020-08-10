//
//  ObservableUseCase.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/6/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

protocol ObservableUseCase {
    
    associatedtype T
    
    func execute() -> Observable<T>
}

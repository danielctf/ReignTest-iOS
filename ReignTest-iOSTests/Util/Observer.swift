//
//  Observer.swift
//  ReignTest-iOSTests
//
//  Created by Daniel Santamaria on 8/17/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import RxSwift

class TestObserver<T> {
    
    var items = [T]()
    private let bag = DisposeBag()
    
    static func new(on subject: PublishSubject<T>) -> TestObserver<T> {
        let observer = TestObserver<T>()
        subject.subscribe(onNext: { value in
            observer.items.append(value)
        }).disposed(by: observer.bag)
        return observer
    }
}

//
//  RxViewController.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 8/7/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import UIKit
import RxSwift

class RxViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    func autoDispose(_ disposable: Disposable) {
        disposable.disposed(by: disposeBag)
    }
}

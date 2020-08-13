//
//  AlertDialog.swift
//  ReignTest-iOS
//
//  Created by Daniel Santamaria on 8/12/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import UIKit

class AlertDialog {
    
    static func showDialog(
        title: String,
        message: String,
        confirmButton: String,
        viewController: UIViewController
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(
            title: confirmButton,
            style: UIAlertAction.Style.default,
            handler: nil)
        )
        viewController.present(alert, animated: true, completion: nil)
    }
}

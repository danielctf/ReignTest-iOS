//
//  PostDetailViewController.swift
//  ReignTest-iOS
//
//  Created by Daniel Santamaria on 8/12/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import UIKit
import WebKit

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Localizable.POST
        webView.load(URLRequest(url: URL(string: url)!))
    }
}

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
    
    private let url: String
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Localizable.POST
        webView.load(URLRequest(url: URL(string: url)!))
    }
}

//
//  ViewController.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 7/29/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostViewController: RxViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    
    private let viewModel = PostViewModel()
    
    convenience init() {
        self.init(nibName: Self.TAG, bundle: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        postTableView.register(
            UINib(nibName: PostTableViewCell.TAG, bundle: nil),
            forCellReuseIdentifier: PostTableViewCell.TAG
        )
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshPosts), for: .valueChanged)
        postTableView.refreshControl = refreshControl
        
        autoDispose(viewModel.loading.subscribe(onNext: { isLoading in
            if (isLoading) {
                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
        }))
        
        autoDispose(viewModel.getPosts().bind(to: postTableView.rx.items(
            cellIdentifier: PostTableViewCell.TAG,
            cellType: PostTableViewCell.self
        )) { row, post, cell in
            cell.setPost(post: post)
        })
    }
    
    @objc private func refreshPosts() {
        viewModel.refreshPosts()
    }
}

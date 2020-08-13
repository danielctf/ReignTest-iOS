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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Localizable.POSTS
        registerPostTableCell()
        let refreshControl = UIRefreshControl()
        setPostTableRefreshControl(refreshControl)
        setLoadingObserver(refreshControl)
        setPostTableItems()
        setPostTableDeleteListener()
        setPostTableClickListener()
        setNavigateToDetailsObserver()
        setErrorObserver()
    }
    
    private func registerPostTableCell() {
        postTableView.register(
            UINib(nibName: PostTableViewCell.TAG, bundle: nil),
            forCellReuseIdentifier: PostTableViewCell.TAG
        )
    }
    
    private func setPostTableRefreshControl(_ refreshControl: UIRefreshControl) {
        refreshControl.addTarget(self, action: #selector(refreshPosts), for: .valueChanged)
        postTableView.refreshControl = refreshControl
    }
    
    @objc private func refreshPosts() {
        viewModel.refreshPosts()
    }
    
    private func setLoadingObserver(_ refreshControl: UIRefreshControl) {
        autoDispose(viewModel.loading.subscribe(onNext: { isLoading in
            if (isLoading) {
                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
        }))
    }
    
    private func setPostTableItems() {
        autoDispose(viewModel.getPosts().bind(to: postTableView.rx.items(
            cellIdentifier: PostTableViewCell.TAG,
            cellType: PostTableViewCell.self
        )) { row, post, cell in
            cell.setPost(post: post)
        })
    }
    
    private func setPostTableDeleteListener() {
        autoDispose(postTableView.rx.modelDeleted(Post.self).subscribe(onNext: { post in
            self.viewModel.deletePost(post: post)
        }))
    }
    
    private func setPostTableClickListener() {
        autoDispose(postTableView.rx.modelSelected(Post.self).subscribe(onNext: { post in
            self.postTableView.deselectRow(at: self.postTableView.indexPathForSelectedRow!, animated: true)
            self.viewModel.postClicked(post: post)
        }))
    }
    
    private func setNavigateToDetailsObserver() {
        autoDispose(viewModel.navigateToDetails.subscribe(onNext: { url in
            let postDetailViewController = PostDetailViewController(url: url)
            self.navigationController?.pushViewController(postDetailViewController, animated: true)
        }))
    }
    
    private func setErrorObserver() {
        autoDispose(viewModel.error.subscribe(onNext: {
            AlertDialog.showDialog(
                title: Localizable.ERROR,
                message: Localizable.POST_NOT_AVAILABLE,
                confirmButton: Localizable.OK,
                viewController: self
            )
        }))
    }
}

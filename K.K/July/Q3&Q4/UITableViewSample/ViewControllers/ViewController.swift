//
//  ViewController.swift
//  APIKitandHimotokiSample
//
//  Created by Kenta Kudo on 2016/07/13.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    private var dataSource = [Repository]()
    private var loading = false
    private var lastLoadedPage = 0
    private var hasNextPage = false
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: .refresh, forControlEvents: .ValueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(refreshControl)
        searchRepositories()
    }
    
    func refresh() {
        
        lastLoadedPage = 0
        searchRepositories()
    }
    
    private func searchRepositories() {
        
        let request = GitHubAPI.SearchRepositoriesRequest(query: "reswift", page: lastLoadedPage + 1)
        Session.sendRequest(request) { [weak self] result in
            guard let `self` = self else {
                return
            }
            
            self.loading = false
            self.indicatorView.stopAnimating()
            self.refreshControl.endRefreshing()
            
            switch result {
                
            case .Success(let searchResult):
                self.lastLoadedPage == 1 ? (self.dataSource = searchResult.items) : (self.dataSource += searchResult.items)
                self.tableView.reloadData()
                self.hasNextPage = searchResult.totalCount > self.dataSource.count
                self.indicatorView.hidden = !self.hasNextPage
                
            case .Failure(let error):
                print("error: \(error)")
            }
        }
        
        loading = true
        indicatorView.startAnimating()
        lastLoadedPage += 1
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let repository = dataSource[indexPath.row]
        cell.textLabel?.text = repository.fullName
        cell.detailTextLabel?.text = "Stars: " + String(repository.stargazersCount)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
        let y = scrollView.contentOffset.y + scrollView.contentInset.top
        let threshold = max(0.0, scrollView.contentSize.height - visibleHeight)
        
        if y > threshold && !loading && hasNextPage {
            
            searchRepositories()
        }
    }
}

private extension Selector {
    static let refresh = #selector(ViewController.refresh)
}

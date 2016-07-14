//
//  ViewController.swift
//  UITableViewSample
//
//  Created by Kenta Kudo on 2016/07/13.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = GitHubAPI.SearchRepositoriesRequest()
        Session.sendRequest(request) { [weak self] result in
            guard let `self` = self else {
                return
            }
            
            switch result {
                
            case .Success(let searchResult):
                self.dataSource = searchResult.items
                self.tableView.reloadData()
                
            case .Failure(let error):
                print("error: \(error)")
            }
        }
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

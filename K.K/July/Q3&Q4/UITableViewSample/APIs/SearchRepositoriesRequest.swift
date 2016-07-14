//
//  SearchRepositoriesRequest.swift
//  APIKitandHimotokiSample
//
//  Created by Kenta Kudo on 2016/07/13.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

import Foundation
import APIKit

extension GitHubAPI {
    
    struct SearchRepositoriesRequest: GitHubRequestType {
        
        typealias Response = SearchRepositoryResult
        
        let query: String
        let page : Int
        
        init(query: String = "swift", page: Int = 1) {
            self.query = query
            self.page  = page
        }
        
        var method: HTTPMethod {
            return .GET
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var parameters: AnyObject? {
            return ["q": query, "page": page]
        }
    }
}

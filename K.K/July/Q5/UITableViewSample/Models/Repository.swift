//
//  Repository.swift
//  APIKitandHimotokiSample
//
//  Created by Kenta Kudo on 2016/07/13.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

import Foundation
import Himotoki

struct Repository {
    
    let id: Int
    let fullName: String
    let url: NSURL
    let createdAt: NSDate
    let stargazersCount: Int
}

extension Repository: Decodable {
    
    static func decode(e: Extractor) throws -> Repository {
        return try Repository(
            id             : e <| "id",
            fullName       : e <| "full_name",
            url            : urlTransformer.apply(e <| "url"),
            createdAt      : dateTransformer.apply(e <| "created_at"),
            stargazersCount: e <| "stargazers_count"
        )
    }
}

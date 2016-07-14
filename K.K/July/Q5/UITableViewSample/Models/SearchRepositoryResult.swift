//
//  SearchRepositoryResult.swift
//  APIKitandHimotokiSample
//
//  Created by Kenta Kudo on 2016/07/13.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

import Foundation
import Himotoki

struct SearchRepositoryResult {
    
    let totalCount: Int
    let items: [Repository]
}

extension SearchRepositoryResult: Decodable {
    
    static func decode(e: Extractor) throws -> SearchRepositoryResult {
        return try SearchRepositoryResult(
            totalCount: e <| "total_count",
            items     : e <|| "items"
        )
    }
}

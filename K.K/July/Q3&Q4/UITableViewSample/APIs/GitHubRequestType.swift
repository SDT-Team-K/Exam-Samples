//
//  GitHubRequestType.swift
//  APIKitandHimotokiSample
//
//  Created by Kenta Kudo on 2016/07/13.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol GitHubRequestType: RequestType {}

extension GitHubRequestType {
    
    var baseURL: NSURL {
        return NSURL(string: "https://api.github.com") ?? NSURL()
    }
}

extension GitHubRequestType where Response: Decodable {
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}

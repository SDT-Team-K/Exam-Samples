//
//  Decodable+Transfomer.swift
//  APIKitandHimotokiSample
//
//  Created by Kenta Kudo on 2016/07/13.
//  Copyright © 2016年 KentaKudo. All rights reserved.
//

import Foundation
import Himotoki

extension Decodable {
    
    static var urlTransformer: Transformer<String, NSURL> {
        return Transformer<String, NSURL> { urlString throws -> NSURL in
            guard let url = NSURL(string: urlString) else {
                throw DecodeError.Custom("Invalid URL string: \(urlString)")
            }
            
            return url
        }
    }
    
    static var dateTransformer: Transformer<String, NSDate> {
        return Transformer<String, NSDate> { dateString throws -> NSDate in
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SS'Z'"
            
            guard let date = dateFormatter.dateFromString(dateString) else {
                throw DecodeError.Custom("Invalid date string: \(dateString)")
            }
            
            return date
        }
    }
}

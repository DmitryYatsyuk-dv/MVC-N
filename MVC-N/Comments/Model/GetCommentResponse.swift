//
//  GetCommentResponse.swift
//  MVC-N
//
//  Created by Lucky on 18/02/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import Foundation

struct GetCommentResponse {
    
    typealias JSON = [String: AnyObject]
    
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? [JSON] else { throw NetworkError.failInternetError}
        
        var comments = [Comment]()
        
        for dict in array {
            guard let comment = Comment(dictionary: dict) else { continue }
            comments.append(comment)
        }
        self.comments = comments
    }
}

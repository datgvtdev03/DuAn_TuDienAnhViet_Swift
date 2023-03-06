//
//  APIHandler.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 10/01/2023.
//

import Foundation
import Alamofire

struct DictModel: Codable {
    let idx: Int
    let word, detail: String
    
    enum CodingKeys: String, CodingKey {
        case idx = "idx"
        case word = "word"
        case detail = "detail"
    }
}

typealias edicts = [DictModel]

//
//  APIHandler.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 10/01/2023.
//

import Foundation
import Alamofire

class APIHandler {
    let PORT = "http://localhost:"
 
    func searchEN(word: String, completion: @escaping(edicts) -> ()){
        
        let url = PORT + "3000/dict/dictionaryen?word=" + word
        AF.request(url, method: .get).responseDecodable(of: edicts.self) {
            response in
            if let jsondata = response.value {
                completion(jsondata)
            } 
        }
    }
    
    
    func getDict(completion: @escaping (edicts) -> ()) {
        let apiDict = PORT + "3000/dict/readdict"
        AF.request(apiDict, method: .get).responseDecodable(of: edicts.self) { (response) in
            if let dictResponse = response.value {
                completion(dictResponse)
            }
        }
        
    }
    
}

//
//  ServiceRequest.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import Foundation
import Alamofire

class ServiceRequest{
    static let shared = ServiceRequest()
    
    func requestAPI(api_key: String, completion: @escaping ( Data?, Error?) -> Void){
        AF.request(api_key).validate().responseJSON { response in
            
            switch response.result {
                case .success(let value):
                    debugPrint(value)
                    completion(response.data, response.error)
                case let .failure(error):
                    print(error)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}

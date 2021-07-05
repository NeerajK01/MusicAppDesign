//
//  ServiceResponse.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import Foundation

class ServiceResponse {
    
    static let shared = ServiceResponse()
    
    func getResponse(apiKey: String, completion: @escaping ( Any?, Error?) -> Void){
        
        ServiceRequest.shared.requestAPI(api_key: apiKey, completion: {
            (response, error) in
            
            if error == nil{
                guard let jsonData = response else { return }
                do{
                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(DataJsonModel.self, from: jsonData)
//                    debugPrint(result)
                    let resultVM = ConvertInToViewModel.shared.convertIntoVM(model: result)
                    completion(resultVM, nil)
                }catch{
                    debugPrint(error)
                    completion(nil, error)
                }
            }
            
        })
        
    }
    
    
    
    
}

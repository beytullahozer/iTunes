//
//  NetworkRequest.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 3.03.2022.
//

import Foundation

class NetworkRequest{
    
    static let shared = NetworkRequest()
    
    private init() {
        print("Network Request inited...")
    }
    
    func requestData(urlString: String, completion: @escaping(Result<Data,Error>) -> Void){
        
        guard let url = URL(string: urlString) else{ return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
    
}

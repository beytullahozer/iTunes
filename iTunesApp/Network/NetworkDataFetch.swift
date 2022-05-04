//
//  NetworkDataFetch.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 3.03.2022.
//

import Foundation

class NetworkDataFetch{
    
    static let shared = NetworkDataFetch()
    
    private init() {
        print("Network Data Fetch inited...")
    }
    
    func fetchAlbum(urlString: String, responce: @escaping (AlbumModel?, Error?) -> Void){
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            
            switch result {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode(AlbumModel.self, from: data)
                    responce(albums, nil)
                } catch let JSONerror {
                    print("Catch Failed the Decode JSON error", JSONerror)
                }
            case .failure(let error):
                print("Error requesting data: \(error.localizedDescription)")
                responce(nil, error)
            }
        }
    }
}

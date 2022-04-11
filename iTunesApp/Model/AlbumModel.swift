//
//  RequestPost.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 3.03.2022.


import Foundation

struct AlbumModel:Decodable{
    let results: [Album]
}

struct Album:Decodable{
    let artistName: String
    let collectionName: String
    let songName: String
    let artworkUrl100: String?
    
    let trackCount: Int
    let releaseDate: String
    let artistId: Int
    let collectionId: Int
    let trackId: Int
}

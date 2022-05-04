//
//  SongsCollectionViewCell.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 8.03.2022.
//

import Foundation
import UIKit

class SongsCollectionViewCell: UICollectionViewCell {


    var stackView = UIStackView()
    
    private var albumLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Album Name: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist Name: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trackCountLabel: UILabel = {
        let label = UILabel()
        label.text = "16 Tracks.."
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    public let nameSongLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Song: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumLogo.layer.cornerRadius = albumLogo.frame.width / 2
    }
    
    
    func setupView(){
        self.backgroundColor = .clear
        self.addSubview(albumLogo)
        self.addSubview(albumNameLabel)
        self.addSubview(artistNameLabel)
        self.addSubview(trackCountLabel)
        self.addSubview(nameSongLabel)
        
        stackView = UIStackView(arrangedSubviews: [artistNameLabel, trackCountLabel])
        self.addSubview(stackView)
    }
    
    func configureAlbumCell(album: Album){
//        
//        if let urlString = album.artworkUrl100 {
//            
//            NetworkRequest.shared.requestData(urlString: urlString) { [weak self] result in
//                switch result {
//                case.success(let data):
//                    let image = UIImage(data: data)
//                    self?.albumLogo.image = image
//                case.failure(let error):
//                    self?.albumLogo.image = nil
//                    print(" No Album Logo " + error.localizedDescription)
//                }
//            }
//
//        } else {
//            albumLogo.image = nil
//        }
//        
//        albumNameLabel.text = album.collectionName
//        artistNameLabel.text = album.artistName
//        trackCountLabel.text = "\(album.trackCount) tracks"
//        nameSongLabel.text = album.songName
    }
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            albumLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            albumLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor ,constant: 15),
            albumLogo.heightAnchor.constraint(equalToConstant: 60),
            albumLogo.widthAnchor.constraint(equalToConstant: 60),
            
            albumNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            albumNameLabel.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10),
            albumNameLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: -10),

            stackView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
    }
}


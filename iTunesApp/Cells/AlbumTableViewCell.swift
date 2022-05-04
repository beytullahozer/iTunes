//
//  AlbumTableViewCell.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 4.03.2022.
//

import Foundation
import UIKit

class AlbumTableViewCell: UITableViewCell{
    
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
        label.backgroundColor = .blue
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist Name: "
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trackCountLabel: UILabel = {
        let label = UILabel()
        label.text = "16 Tracks.."
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .brown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumLogo.layer.cornerRadius = albumLogo.frame.width / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        
        self.addSubview(albumLogo)
        self.addSubview(albumNameLabel)

        
        stackView = UIStackView(arrangedSubviews: [artistNameLabel, trackCountLabel])
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        self.addSubview(stackView)
    }
    
    func setConstraints(){
        
            albumLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            albumLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor ,constant: 15).isActive = true
            albumLogo.heightAnchor.constraint(equalToConstant: 60).isActive = true
            albumLogo.widthAnchor.constraint(equalToConstant: 60).isActive = true
            
            albumNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            albumNameLabel.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10).isActive = true
            albumNameLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: -10).isActive = true

            stackView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10).isActive = true
            stackView.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10).isActive = true
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    
    }
    
    func configureAlbumCell(album: Album){
        
        if let urlString = album.artworkUrl100 {
            NetworkRequest.shared.requestData(urlString: urlString) { [weak self] result in
                switch result {
                case.success(let data):
                    let image = UIImage(data: data)
                    self?.albumLogo.image = image
                case.failure(let error):
                    self?.albumLogo.image = nil
                    print(" No Album Logo " + error.localizedDescription)
                }
            }

        } else {
            albumLogo.image = nil
        }
        
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        trackCountLabel.text = "\(album.trackCount) tracks"
    }
    
    
}

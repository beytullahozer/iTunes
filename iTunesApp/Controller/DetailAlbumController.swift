//
//  DetailAlbumViewController.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 6.03.2022.
//

import UIKit

class DetailAlbumController: UIViewController {
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
    var stackView = UIStackView()
    var album: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setDelegates()
        setModel()
    }
    
    
    private let albumLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 50, width: 200, height: 80)
        label.text = "Album Name: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 70, width: 200, height: 80)
        label.text = "Artist Name: "
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trackCountLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 90, width: 200, height: 80)
        label.text = "16 Tracks.."
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 110, width: 200, height: 80)
        label.text = "22.22.2222"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private func setupView(){
        
        view.backgroundColor = .white
        
        view.addSubview(albumLogo)
      
        stackView = UIStackView(arrangedSubviews: [albumNameLabel, artistNameLabel, releaseDateLabel, trackCountLabel])
        view.addSubview(stackView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        view.addSubview(collectionView)
    }
    
    private func configureAlbumCell(album: Album){
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        trackCountLabel.text = "\(album.trackCount) tracks"
    }
    
    private func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setModel(){
        
        guard let album = album else { return }
        
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        trackCountLabel.text = "\(album.trackCount) tracks:"
        releaseDateLabel.text = setDataFormat(date: album.releaseDate)
        
        guard let url = album.artworkUrl100 else { return }
        setImage(urlString: url)
    }
    
    private func setDataFormat(date: String) -> String{
        
        // "2005-01-01T12:00:00Z"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        
        guard let backEndDate = dateFormatter.date(from: date) else { return "" }
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd-MM-yyyy"
        let date = formatDate.string(from: backEndDate)
        
        return date
    }
    
    private func setImage(urlString: String?){
   
        if let url = urlString {
            
            NetworkRequest.shared.requestData(urlString: url) { [weak self] result in
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
    }
}

extension DetailAlbumController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongsCollectionViewCell
        cell.nameSongLabel.text = "Name Song"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 20)
    }
}

extension DetailAlbumController{
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
            albumLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            albumLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 20),
            albumLogo.heightAnchor.constraint(equalToConstant: 100),
            albumLogo.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            collectionView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 17),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}

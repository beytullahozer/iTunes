//
//  AlbumViewController.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 1.03.2022.
//

import UIKit

class AlbumViewController: UIViewController {

    let tableView = UITableView()
    let searchView = UIView()
    let discoverBackground = UIImageView()
    let searchController = UISearchController(searchResultsController: nil)
    
    var album = [Album]()
    var timer: Timer?
    
    struct Cell{
        static let cell = "cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setAddSubviews()
        setDelegates()
        setConstraints()
        setNavigationBar()
        setSearchController()
        view.backgroundColor = .red
        
//        fetchAlbums(albumName: "Sheffield")
        
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    private func setupView(){
        
        
        discoverBackground.image = UIImage(named: "img_bg")
        discoverBackground.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .white
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: Cell.cell)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        searchView.translatesAutoresizingMaskIntoConstraints = false

        
        
    }
    
    private func setAddSubviews(){
        
        view.addSubview(discoverBackground)
        view.addSubview(tableView)
        view.addSubview(searchView)
        searchView.addSubview(searchController.searchBar)
    }
    
    private func setDelegates(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchBar.delegate = self
    }
    
    
    private func setConstraints(){
        guard let superview = discoverBackground.superview else { return }
        
        discoverBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        discoverBackground.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        discoverBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        discoverBackground.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        searchView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 175).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
  }
    
    private func setNavigationBar(){
        
        navigationItem.title = "Albums"
        navigationItem.searchController = searchController
        
//        let userInfoButton = createCustomButton(selector: #selector(userInfoButtonTapped))
//        navigationItem.rightBarButtonItem = userInfoButton
    }
    
    private func setSearchController(){
        
        searchController.resignFirstResponder()
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.searchBarStyle = UISearchBar.Style.default
        searchController.searchBar.sizeToFit()
//        searchController.searchBar.isTranslucent = false
//        searchController.searchBar.backgroundImage = UIImage()
    }
    
    
    
    private func fetchAlbums(albumName: String){
        
        let urlString = "https://itunes.apple.com/search?term=\(albumName)&entity=album&attribute=albumTerm"
//        let urlString = "https://itunes.apple.com/search?term=\(albumName)jack+johnson"
        
        NetworkDataFetch.shared.fetchAlbum(urlString: urlString) { [weak self] AlbumModel, error in
            
            if error == nil{
                
                guard let albumModel = AlbumModel else { return }
                
//                let sortedAlbums = albumModel.results.sorted { firstItem, secondItem in
//                    return firstItem.collectionName.compare(secondItem.collectionName) == ComparisonResult.orderedAscending
//                }
                
                self?.album = albumModel.results
//                self?.album = sortedAlbums
                print(self?.album)
                self?.tableView.reloadData()
                
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    
    @objc private func userInfoButtonTapped(){
        
//        let profileViewController = ProfileInfoViewController()
//        navigationController?.pushViewController(ProfileInfoViewController(), animated: true)
    }
    
}

extension AlbumViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searchController.isActive {
//            return results.count
//        } else {
//            return album.count
//        }
//        album.count
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cell, for: indexPath) as! AlbumTableViewCell
        let album = album[indexPath.row]
        cell.configureAlbumCell(album: album)
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAlbumViewController = DetailAlbumController()
        let album = album[indexPath.row]
        detailAlbumViewController.album = album
        detailAlbumViewController.title = album.artistName
        navigationController?.pushViewController(detailAlbumViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension AlbumViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar editing begin..")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search bar editing end..")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
                self?.fetchAlbums(albumName: searchText)
            })
        }
    }
}



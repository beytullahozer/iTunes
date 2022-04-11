//
//  MainVC.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 4.03.2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController{
    
    let startButton = UIButton()
    let discoverBackground = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    func setupView(){
        discoverBackground.image = UIImage(named: "img_bg")
        view.addSubview(discoverBackground)
        
        startButton.setTitle(NSLocalizedString("Start", comment: ""), for: UIControl.State.normal)
        startButton.titleLabel?.font = UIFont(name: "Graphie-Regular", size: 30)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.layer.shadowColor = UIColor(red: 0.44, green: 0.56, blue: 0.69, alpha: 0.20).cgColor
        startButton.layer.shadowRadius = 5
        startButton.layer.shadowOpacity = 1.4
        startButton.contentVerticalAlignment.self = .center
        startButton.contentHorizontalAlignment.self = .center
        startButton.contentHorizontalAlignment.self = UIControl.ContentHorizontalAlignment.left
        view.addSubview(startButton)
                
        startButton.addTarget(self, action: #selector(startButtonClicked), for: UIControl.Event.touchUpInside)
    }
    
    func setConstraints(){
        guard let superview = discoverBackground.superview else { return }
        
        discoverBackground.translatesAutoresizingMaskIntoConstraints = false
        discoverBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        discoverBackground.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        discoverBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        discoverBackground.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  
  }
    
    @objc func startButtonClicked(){
        let navVC = UINavigationController(rootViewController: AlbumViewController())
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
}

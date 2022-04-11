//
//  Extension+UIVC.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 4.03.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "KO", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}

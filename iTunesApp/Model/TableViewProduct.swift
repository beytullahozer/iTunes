//
//  iTunesTableViewCell.swift
//  iTunesApp
//
//  Created by Beytullah Özer on 3.03.2022.
//

import UIKit

struct TableViewProduct {
    var sectionName: String
    var productName: [String]
    
    init(sectionName: String, productName: [String]) {
        self.sectionName = sectionName
        self.productName = productName
    }
}

//
//  Shared.swift
//  Baby Sleep
//
//  Created by Beytullah Özer on 23.04.2021.
//

import Foundation
import UIKit


// Size

var screenHeight = CGFloat()
var screenWidth = CGFloat()
var stringMultiplier = CGFloat()
var ScreenWidth_To_ScreenHeight_Converter = CGFloat()
var ScreenHeight_To_ScreenWidth_Converter = CGFloat()
var lastObjectFrane = CGRect()
let uDefaults = UserDefaults.standard


func setDefaultSize(view : UIView){
    
    screenHeight = view.frame.size.height
    screenWidth = view.frame.size.width
    stringMultiplier = 0.00115 * screenHeight
    ScreenWidth_To_ScreenHeight_Converter = 1 / screenWidth * screenHeight / 2.1642
    ScreenHeight_To_ScreenWidth_Converter = 1 / screenHeight * screenWidth / 0.4620
    
}


var screen_ratio = CGFloat()

// Default Color


var clr_blue = UIColor(red: 0.12, green: 0.42, blue: 1.00, alpha: 1.00)
var clr_seperator = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1.00)
var clr_placeholder = UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 1.00)
var clr_highlightedBtn = UIColor(red: 0.79, green: 0.80, blue: 0.83, alpha: 1.00)
var clr_alert = UIColor(red: 1.00, green: 0.19, blue: 0.19, alpha: 1.00)
var clr_unselectedTabbarTitle = UIColor(red: 0.67, green: 0.72, blue: 0.78, alpha: 1.00)
// Default URLs




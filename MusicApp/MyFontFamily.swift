//
//  MyFontFamily.swift
//  MusicApp
//
//  Created by LeeX on 11/14/18.
//  Copyright © 2018 Huy Le Hoang. All rights reserved.
//

import Foundation

enum MyFontFamily: String {
    
    case displayBold = "SF-Pro-Display-Bold"
    case displayMedium = "SF-Pro-Display-Medium"
    case displayRegular = "SF-Pro-Display-Regular"
    case displaySemiBold = "SF-Pro-Display-Semibold"
    case bold = "SF-Pro-Text-Bold"
    case medium = "SF-Pro-Text-Medium"
    case regular = "SF-Pro-Text-Regular"
    case semibold = "SF-Pro-Text-Semibold"
    
    func font(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
    
    func ctFont(size: CGFloat) -> CTFont {
        return CTFontCreateWithName((self.rawValue as CFString?)!, size, nil)
    }
}

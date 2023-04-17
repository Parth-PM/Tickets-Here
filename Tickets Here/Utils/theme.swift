//
//  Theme.swift
//  MovieBookingApp
//
//  Authors: Shrinal Patel (301204864)
//           Ridham Patel (301207688)
//           Pushparaj Sanjeevan (301213104)
//

import Foundation
import UIKit
enum ThemeType {
    case red, yellow
}
struct Theme {
    var labelColor: UIColor
    var backgroundColor: UIColor
    var buttonBackgroundColor: UIColor
    var textFieldBackgroundColor: UIColor
    
    static let defaultTheme = Theme(labelColor: .white, backgroundColor: hex("#3A3A3A"), buttonBackgroundColor: hex("#DB473F"), textFieldBackgroundColor: hex("#4C4B4B"))
    
}



class ThemeDB {
    static var selectedTheme: Theme = .defaultTheme
    static var selectedThemeType: ThemeType = .red {
        didSet {
            UserDefaults.standard.set(selectedThemeType == .red ? 0 : 1, forKey: "theme")
        }
    }
    static func setTheme(_ theme: ThemeType) {
        switch theme {
        case .red:
            selectedTheme = .defaultTheme
            selectedThemeType = .red
        case .yellow:
            selectedTheme = Theme(labelColor: .white, backgroundColor: hex("#096A89"), buttonBackgroundColor: hex("#E59700"), textFieldBackgroundColor: hex("#4493AC"))
            selectedThemeType = .yellow
        }
    }
    static func loadTheme() {
        let theme = UserDefaults.standard.value(forKey: "theme") as? Int ?? 0
        setTheme(theme == 0 ? .red : .yellow)
    }
}

extension Notification.Name {
    static let themeChange = Notification.Name("themeChange")
}


func hex(_ hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//
//  Resources.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 26.02.2023.
//

import UIKit

typealias R = Resources
struct Resources {
    
    enum Colors {

        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let separatorColor = UIColor(hexString: "#E8ECEF")
        static let navGrayTitle = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
    }
    
    enum Pictures {
        enum TabBar {
            enum Icons {
                static let overview = UIImage(named: "House Icon")
                static let session = UIImage(named: "Clock Icon")
                static let progress = UIImage(named: "Analytics Bars")
                static let settings = UIImage(named: "Gear Icon")
                
            }
        }
    }
    
    enum Strings {
        enum TabBar {
            enum TabsLabels {
                static let overview = "Overview"
                static let session = "Session"
                static let progress = "Progress"
                static let settings = "Settings"
            }
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        
    }
    
    enum Constants {
        
    }
}

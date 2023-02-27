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
        static let secondary = UIColor(hexString: "#F0F3FF")
        
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
        enum NavBar {
            enum Common {
                static let downArrow = UIImage(named: "down arrow")
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
        
        enum NavBar {
            enum Titles {
                static let overview = ""
                static let session = "High Intensity Cardio"
                static let progress = "Workout Progress"
                static let settings = "Settings"
            }
        }
        
        enum Controllers {
            enum Overview {
                enum Buttons {
                    static let allWorkout = "All Workouts"
                }
            }
            enum Session {
                static let navBarLeftButton = "Pause"
                static let navBarRightButton = "Finish"
            }
            enum Progress {
                static let navBarLeftButton = "Export"
                static let navBarRightButton = "Details"
            }
            enum Settings {
                static let navBarRightButton = "Log Out"
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

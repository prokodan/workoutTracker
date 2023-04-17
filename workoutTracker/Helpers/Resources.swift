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
        static let navGreyTitle = UIColor(hexString: "#545C77")
        static let subtitleGrey = UIColor(hexString: "#9BA4B0")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let background = UIColor(hexString: "#F8F9F9")
        
    }
    
    enum Pictures {
        enum TabBar {
            static func icons(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "House Icon")
                case .session: return UIImage(named: "Clock Icon")
                case .progress: return UIImage(named: "Analytics Bars")
                case .settings: return UIImage(named: "Gear Icon")
                }
            }
        }
        enum NavBar {
            enum Common {
                static let downArrow = UIImage(named: "down arrow")
                static let add = UIImage(named: "Add")
            }
        }
        enum Controller {
            enum Overview {
                static let rightArrow = UIImage(named: "Right Arrow")
                static let checkmarkEmpty = UIImage(named: "Checkmark Empty")
                static let checkmarkFilled = UIImage(named: "Checkmark Filled")
            }
            enum Session {
                static let heartRate = UIImage(named: "Heart Beat Icon")
                static let averagePace = UIImage(named: "Speed Icon")
                static let totalSteps = UIImage(named: "Steps Icon")
                static let totalDistance = UIImage(named: "Maps Icon")
            }
            enum Progress {
                
            }
            enum Settings {
                
            }
        }
    }
    
    enum Strings {
        enum TabBar {
            static func tabsLabels(for tab: Tabs) -> String? {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
            enum NavBar {
                enum Titles {
                    static let overview = ""
                    static let session = "High Intensity Cardio"
                    static let progress = "Workout Progress"
                    static let settings = "Settings"
                }
                enum Buttons {
                    static let allWorkout = "All Workouts"
                    static let navBarStart = "Start"
                    static let navBarPause = "Pause"
                    static let navBarFinish = "Finish"
                }
            }
            
            enum Controllers {
                enum Overview {
                                   
                }
                enum Session {
                    static let elapsedTime = "Elapsed time"
                    static let remainingTime = "Remaining time"
                    static let completedPercent = "Completed"
                    static let remainingPercent = "Remaining"
                    
                    static let workoutStats = "Workout stats"
                    static let heartRate = "Heart rate"
                    static let averagePace = "Average pace"
                    static let totalSteps = "Total steps"
                    static let totalDistance = "Total distance"
                    
                    static let stepsCounter = "Steps Counter"
                    
                    
                    
                    enum Buttons {
                        
                    }
                }
                enum Progress {
                    static let navBarLeftButton = "Export"
                    static let navBarRightButton = "Details"
                    static let dailyPerformance = "Daily Performance".uppercased()
                    static let monthlyPerformance = "Monthly Performance".uppercased()

                    enum Buttons {
                        static let dailyPerformanceButton = "Last 7 days".uppercased()
                        static let monthlyPerformanceButton = "Last 10 months".uppercased()
                    }
                }
                enum Settings {
                    static let navBarRightButton = "Log Out"
                }
            }
        }
        
        enum Fonts {
            static func helveticaBold(with size: CGFloat) -> UIFont {
                UIFont(name: "Helvetica-Bold", size: size) ?? UIFont()
            }
            static func helveticaRegular(with size: CGFloat) -> UIFont {
                UIFont(name: "Helvetica", size: size) ?? UIFont()
            }
            static func helveticaLight(with size: CGFloat) -> UIFont {
                UIFont(name: "Helvetica-Light", size: size) ?? UIFont()
            }
            
        }
        
        enum Constants {
            
        }
}

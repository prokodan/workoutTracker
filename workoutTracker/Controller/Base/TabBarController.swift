//
//  TabBarController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 26.02.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = R.Colors.separatorColor.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
//        let overviewController = OverviewController()
//        let sessionController = SessionController()
//        let progresscontroller = ProgressController()
//        let settingsController = SettingsController()
//
//        let overviewNavigationController = NavBarController(rootViewController: overviewController)
//        let sessionNavigationController = NavBarController(rootViewController: sessionController)
//        let progressNavigationController = NavBarController(rootViewController: progresscontroller)
//        let settingsNavigationController = NavBarController(rootViewController: settingsController)
        
//        overviewNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.overview, image: R.Pictures.TabBar.Icons.overview, tag: Tabs.overview.rawValue)
//        sessionNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.session, image: R.Pictures.TabBar.Icons.session, tag: Tabs.session.rawValue)
//        progressNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.progress, image: R.Pictures.TabBar.Icons.progress, tag: Tabs.progress.rawValue)
//        settingsNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.settings, image: R.Pictures.TabBar.Icons.settings, tag: Tabs.settings.rawValue)
        
        let controllers: [NavBarController] = Tabs.allCases.map {tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.tabsLabels(for: tab), image: R.Pictures.TabBar.icons(for: tab), tag: tab.rawValue)
            return controller
        }
        
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .overview: return OverviewController()
        case .session: return SessionController()
        case .progress: return ProgressController()
        case .settings: return SettingsController()
        }
    }
    
}

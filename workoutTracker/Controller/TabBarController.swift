//
//  TabBarController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 26.02.2023.
//

import UIKit

enum Tabs: Int {
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
        tabBar.layer.borderWidth = 2
        tabBar.layer.masksToBounds = true
        
        let overviewController = UIViewController()
        let sessionController = UIViewController()
        let progresscontroller = UIViewController()
        let settingsController = UIViewController()
        
        let overviewNavigationController = UINavigationController(rootViewController: overviewController)
        let sessionNavigationController = UINavigationController(rootViewController: sessionController)
        let progressNavigationController = UINavigationController(rootViewController: progresscontroller)
        let settingsNavigationController = UINavigationController(rootViewController: settingsController)
        
        overviewNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.overview, image: R.Pictures.TabBar.Icons.overview, tag: Tabs.overview.rawValue)
        sessionNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.session, image: R.Pictures.TabBar.Icons.session, tag: Tabs.session.rawValue)
        progressNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.progress, image: R.Pictures.TabBar.Icons.progress, tag: Tabs.progress.rawValue)
        settingsNavigationController.tabBarItem = UITabBarItem(title: R.Strings.TabBar.TabsLabels.settings, image: R.Pictures.TabBar.Icons.settings, tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigationController,
            sessionNavigationController,
            progressNavigationController,
            settingsNavigationController
        ], animated: false)
    }
    
}

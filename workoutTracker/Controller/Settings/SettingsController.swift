//
//  SettingsController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class SettingsController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.Titles.settings
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .settings)
        addNavBarButton(at: .right, with: R.Strings.Controllers.Settings.navBarRightButton)
    }
}

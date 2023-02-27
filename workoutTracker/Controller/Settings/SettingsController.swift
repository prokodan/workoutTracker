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
        title = "Settings"
        navigationController?.tabBarItem.title = R.Strings.TabBar.TabsLabels.settings
    }
}

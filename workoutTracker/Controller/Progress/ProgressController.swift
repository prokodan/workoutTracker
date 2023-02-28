//
//  ProgressController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class ProgressController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.Titles.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .progress)
        
        addNavBarButton(at: .left, with: R.Strings.Controllers.Progress.navBarLeftButton)
        addNavBarButton(at: .right, with: R.Strings.Controllers.Progress.navBarRightButton)
    }
}

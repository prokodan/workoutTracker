//
//  OverviewController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 26.02.2023.
//

import UIKit

class OverviewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarItem.title = R.Strings.TabBar.TabsLabels.overview
    }


}


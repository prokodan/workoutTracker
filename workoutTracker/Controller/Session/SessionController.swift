//
//  SessionController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class SessionController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.Titles.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Controllers.Session.navBarLeftButton)
        addNavBarButton(at: .right, with: R.Strings.Controllers.Session.navBarRightButton)
    }
    
    override func navBarLeftButtonAction() {
        print("Session left button tapped")
    }
    
    override func navBarRightButtonAction() {
        print("Session right button tapped")
    }
}

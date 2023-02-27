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
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = R.Strings.TabBar.TabsLabels.session
        
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }
    
    override func navBarLeftButtonAction() {
        print("Session left button tapped")
    }
    
    override func navBarRightButtonAction() {
        print("Session right button tapped")
    }
}

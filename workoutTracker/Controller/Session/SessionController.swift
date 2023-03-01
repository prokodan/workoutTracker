//
//  SessionController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: BaseInfoView = {
        let view = BaseInfoView(with: "Test", alignment: .center)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.Titles.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Controllers.Session.navBarLeftButton)
        addNavBarButton(at: .right, with: R.Strings.Controllers.Session.navBarRightButton)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    override func navBarLeftButtonAction() {
//        print("Session left button tapped")
    }
    
    override func navBarRightButtonAction() {
//        print("Session right button tapped")
    }
    
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        view.addView(timerView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}

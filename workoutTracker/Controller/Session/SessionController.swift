//
//  SessionController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class SessionController: WABaseController {
    
    private let timerView = TimerView()
    
    private let timerDuration = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    override func navBarLeftButtonAction() {
        if timerView.timerState == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        timerView.timerState = timerView.timerState == .isRunning ? .isStopped : .isRunning
        addNavBarButton(at: .left, with: timerView.timerState == .isRunning ? R.Strings.Controllers.Session.navBarPause : R.Strings.Controllers.Session.navBarStart)
    }
    
    override func navBarRightButtonAction() {
        timerView.stopTimer()
        timerView.timerState = .isStopped
        addNavBarButton(at: .left, with: R.Strings.Controllers.Session.navBarStart)
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
        
        title = R.Strings.NavBar.Titles.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Controllers.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Controllers.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, and: 0)
    }
}

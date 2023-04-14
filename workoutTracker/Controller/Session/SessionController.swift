//
//  SessionController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class SessionController: WABaseController {
    
    private let timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Controllers.Session.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Controllers.Session.stepsCounter)
    
    private let timerDuration = 5.0
    
    override func navBarLeftButtonAction() {
        if timerView.timerState == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        timerView.timerState = timerView.timerState == .isRunning ? .isStopped : .isRunning
        addNavBarButton(at: .left, with: timerView.timerState == .isRunning ? R.Strings.NavBar.Buttons.navBarPause : R.Strings.NavBar.Buttons.navBarStart)
    }
    
    override func navBarRightButtonAction() {
        timerView.stopTimer()
        timerView.timerState = .isStopped
        addNavBarButton(at: .left, with: R.Strings.NavBar.Buttons.navBarStart)
    }
    
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        [
            timerView,
            statsView,
            stepsView
        ].forEach { view.addView($0)
            
        }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 11),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 11),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.Titles.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.NavBar.Buttons.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.NavBar.Buttons.navBarFinish)
        
        timerView.configure(with: timerDuration, and: 0)
        timerView.callBack = { [weak self ] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.navBarRightButtonAction()
            }
        }

        statsView.configure(with: [
                                    .heartRate(value: "155"),
                                    .averagePace(value: "8'20''"),
                                    .totalSteps(value: "7,682"),
                                    .totalDistance(value: "8.25")
        ]
        )
        stepsView.configure(with: [.init(value: "8k", heightMultiplier: 1, title: "2/14"),
                                   .init(value: "7k", heightMultiplier: 0.8, title: "2/15"),
                                   .init(value: "5k", heightMultiplier: 0.6, title: "2/16"),
                                   .init(value: "6k", heightMultiplier: 0.7, title: "2/17")
                                   
                                  ])
    }
}

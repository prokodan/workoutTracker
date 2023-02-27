//
//  OverviewController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 26.02.2023.
//

import UIKit

class OverviewController: BaseController {

    private let allWorkoutsButton = SecondaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.Titles.overview
        navigationController?.tabBarItem.title = R.Strings.TabBar.TabsLabels.overview
        addViews()
        layoutViews()
        configure()
    }


    
}

extension OverviewController {
    override func addViews() {
        super.addViews()
        
        view.addView(allWorkoutsButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            allWorkoutsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    override func configure() {
        super.configure()
        
        allWorkoutsButton.setTitle(Resources.Strings.Controllers.Overview.Buttons.allWorkout)
        allWorkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonAction), for: .touchUpInside)
    }
}

@objc
extension OverviewController {
    func allWorkoutsButtonAction() {
        print("AllWorkoutsButton Tapped")
    }
}

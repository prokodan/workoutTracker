//
//  OverviewController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 26.02.2023.
//

import UIKit

class OverviewController: BaseController {

    private let navBar = OverviewNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.Titles.overview
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .overview)
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        [navBar].forEach {view.addView($0)}

    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navigationController?.navigationBar.isHidden = true

    }
}


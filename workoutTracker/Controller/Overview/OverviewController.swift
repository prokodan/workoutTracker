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
        addViews()
        layoutViews()
        configure()
    }


    
}

extension OverviewController {
    override func addViews() {
        super.addViews()
        [navBar].forEach {view.addView($0)}

    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true

    }
}


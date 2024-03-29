//
//  ProgressController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class ProgressController: WABaseController {
    
    private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.Controllers.Progress.dailyPerformance, buttonTitle: R.Strings.Controllers.Progress.Buttons.dailyPerformanceButton)
    private let monthlyPerformanceView = MonthlyPerformanceView(with: R.Strings.Controllers.Progress.monthlyPerformance, buttonTitle: R.Strings.Controllers.Progress.Buttons.monthlyPerformanceButton)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.Strings.NavBar.Titles.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .progress)
        
        addNavBarButton(at: .left, with: R.Strings.Controllers.Progress.navBarLeftButton)
        addNavBarButton(at: .right, with: R.Strings.Controllers.Progress.navBarRightButton)
    }
}

extension ProgressController {
    override func setupViews() {
        super.setupViews()
        
        [
            dailyPerformanceView,
            monthlyPerformanceView
        ].forEach { view.addView($0)
            
        }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06)
            
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.Titles.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.tabsLabels(for: .progress)
        
        dailyPerformanceView.configure(with: [
                                .init(value: "5", heightMultiplier: 1, title: "Mon"),
                                .init(value: "4", heightMultiplier: 0.8, title: "Tue"),
                                .init(value: "3", heightMultiplier: 0.6, title: "Wed"),
                                .init(value: "3.5", heightMultiplier: 0.7, title: "Thu"),
                                .init(value: "1", heightMultiplier: 0.1, title: "Fri"),
                                .init(value: "3", heightMultiplier: 0.6, title: "Sat"),
                                .init(value: "4", heightMultiplier: 0.8, title: "Sun")
                                
                                  ])
        
        monthlyPerformanceView.configure(with: [
                                                .init(title: "Mar", value: 45),
                                                .init(title: "Apr", value: 55),
                                                .init(title: "May", value: 60),
                                                .init(title: "Jun", value: 65),
                                                .init(title: "Jul", value: 70),
                                                .init(title: "Aug", value: 80),
                                                .init(title: "Sep", value: 65),
                                                .init(title: "Oct", value: 45),
                                                .init(title: "Nov", value: 30),
                                                .init(title: "Dec", value: 15),
                                               ],
                                         topChartOffset: 10)
        

        
    }
}

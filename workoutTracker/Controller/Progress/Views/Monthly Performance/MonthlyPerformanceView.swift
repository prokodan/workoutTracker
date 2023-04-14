//
//  MonthlyPerformanceView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 14.04.2023.
//

import UIKit

final class MonthlyPerformanceView: WABaseInfoView {
    
    private let chartsView = WAChartsView()
  
    func configure(with items: [WAChartsView.Data]) {

        chartsView.configure(with: items)
    }
}

extension MonthlyPerformanceView {
    override func setupViews() {
        super.setupViews()
        [chartsView].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
       
    }
}

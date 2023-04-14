//
//  DailyPerformanceView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 13.04.2023.
//

import UIKit

final class DailyPerformanceView: WABaseInfoView {
    
    private let barsView = WABarsView()
  
    func configure(with items: [WABarView.BarData]) {

        barsView.configure(with: items)
    }
}

extension DailyPerformanceView {
    override func setupViews() {
        super.setupViews()
        [barsView].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}

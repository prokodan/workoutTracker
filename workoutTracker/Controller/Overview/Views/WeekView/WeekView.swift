//
//  WeekView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

final class WeekView: BaseView {

    private var calendar = Calendar.current
    
    private let stackView = UIStackView()
}

extension WeekView {
    override func setupViews() {
        super.setupViews()
        [stackView].forEach {addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        
        
        
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        
        if calendar.firstWeekday == 1 {
            let sunD = weekdays.remove(at: 0)
            weekdays.append(sunD)
        }
        
        weekdays.enumerated().forEach { index, day in
            let view = WeekdayView()
            view.configure(with: index, and: day)
            stackView.addArrangedSubview(view)
        }
    }
}

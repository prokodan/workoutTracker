//
//  WeekdayView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

extension WeekView {
    
    final class WeekdayView: WABaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String) {
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.agoForward(to: index)
            let day = Date.calendar.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            backgroundColor = isToday ? R.Colors.active : R.Colors.background
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : R.Colors.inactive
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : R.Colors.inactive
        }
    }
}

    extension WeekView.WeekdayView {
        
        override func setupViews() {
            super.setupViews()
            [stackView].forEach {addView($0)}
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(dateLabel)
        }
        
        override func constraintViews() {
            super.constraintViews()
            
            NSLayoutConstraint.activate([
                stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
            
        }
        
        override func configureAppearance() {
            super.configureAppearance()
            layer.cornerRadius = 5
            layer.masksToBounds = true
            
            nameLabel.font = R.Fonts.helveticaBold(with: 9)
            nameLabel.textAlignment = .center
            dateLabel.font = R.Fonts.helveticaLight(with: 15)
            dateLabel.textAlignment = .center
            
            
            stackView.spacing = 3
            stackView.axis = .vertical
        }
    }

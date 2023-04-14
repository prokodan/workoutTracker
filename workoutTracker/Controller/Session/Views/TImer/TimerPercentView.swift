//
//  TimerPercentView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 02.03.2023.
//

import UIKit
extension TimerView {
    final class TimerPercentView: WABaseView {
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 23)
            label.textColor = R.Colors.navGreyTitle
            label.textAlignment = .center
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaLight(with: 10)
            label.textColor = R.Colors.subtitleGrey
            label.textAlignment = .center
            return label
        }()
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 2.5
            
            return view
        }()
        
        func configure(with title: String, and value: Int) {
            subtitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
        
        override func setupViews() {
            super.setupViews()
            addView(stackView)
            [
                percentLabel,
                subtitleLabel
            ].forEach { stackView.addArrangedSubview($0)}
        }
        
        override func constraintViews() {
            super.constraintViews()
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
        
        override func configureAppearance() {
            super.configureAppearance()
        }
    }
}



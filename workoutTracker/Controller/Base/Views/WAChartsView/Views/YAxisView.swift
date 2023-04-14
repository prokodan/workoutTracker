//
//  YAxisView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 14.04.2023.
//

import UIKit

final class YAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
//        guard let maxValue = data.sorted(by: {$0.value > $1.value}).first?.value else { return }

        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach {
            let label = UILabel()
            label.font = R.Fonts.helveticaLight(with: 9)
            label.textColor = R.Colors.inactive
            label.textAlignment = .right
            label.text = "\($0 * 10)" // TODO: Remake calculation of interval
            stackView.addArrangedSubview(label)
        }
    }
}

extension YAxisView {
    
    override func setupViews() {
        super.setupViews()
        [
            stackView
        ].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}


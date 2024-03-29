//
//  WABarsView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 03.03.2023.
//

import UIKit

final class WABarsView: WABaseView {
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WABarView.BarData]) {
        data.forEach {
            let barView = WABarView(data: $0)
            
            stackView.addArrangedSubview(barView)
        }
    }
}

extension WABarsView {
    
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

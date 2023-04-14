//
//  WABarView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 03.03.2023.
//

import UIKit

extension WABarView {
    struct BarData {
        let value: String
        let heightMultiplier: Double
        let title: String
    }
}

final class WABarView: WABaseView {
    
    private let heightMultiplier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.active
        return label
    }()
    private let barVeiw: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaLight(with: 9)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    init(data: BarData) {
        self.heightMultiplier = data.heightMultiplier
        super.init(frame: .zero)
        valueLabel.text = data.value
        titleLabel.text = data.title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
    
//    func configure(with data: [WABarView]) {
//        super.init.(frame: .zero)
//
//    }
}

extension WABarView {
    
    override func setupViews() {
        super.setupViews()
        [
            valueLabel,
            barVeiw,
            titleLabel
        ].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            barVeiw.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 7),
            barVeiw.centerXAnchor.constraint(equalTo: centerXAnchor),
            barVeiw.widthAnchor.constraint(equalToConstant: 17),
            barVeiw.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier * 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: barVeiw.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10),

            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}


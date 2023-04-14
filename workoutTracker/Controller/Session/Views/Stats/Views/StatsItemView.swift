//
//  StatsItemView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 02.03.2023.
//

import UIKit

enum StatsItem {
    case heartRate(value: String)
    case averagePace(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .heartRate(let value):
            return .init(image: R.Pictures.Controller.Session.heartRate,
                         value: value + " bpm",
                         title: R.Strings.Controllers.Session.heartRate)
        case .averagePace(let value):
            return .init(image: R.Pictures.Controller.Session.averagePace,
                         value: value + " / km",
                         title: R.Strings.Controllers.Session.averagePace)
        case .totalDistance(let value):
            return .init(image: R.Pictures.Controller.Session.totalDistance,
                         value: value  + "km",
                         title: R.Strings.Controllers.Session.totalDistance)
        case .totalSteps(let value):
            return .init(image: R.Pictures.Controller.Session.totalSteps,
                         value: value,
                         title: R.Strings.Controllers.Session.totalSteps)
        }
    }
}

final class StatsItemView: WABaseView {
    
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView = UIImageView()
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.navGreyTitle
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaLight(with: 10)
        label.textColor = R.Colors.inactive
        return label
    }()
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title.uppercased()
    }
    
    
}

extension StatsItemView {
    override func setupViews() {
        super.setupViews()
        
        [
            imageView,
            stackView
        ].forEach { addView($0) }
        
        [
            valueLabel, titleLabel
        ].forEach { stackView.addArrangedSubview($0) }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 14),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

//
//  OverviewNavBar.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

final class OverviewNavBar: WABaseView {
    
    private let allWorkoutsButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(R.Strings.NavBar.Buttons.allWorkout)
        return button
    }()
    private let addButton = UIButton()
    private let titleLabel = UILabel()
    private let weekView = WeekView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(withColor: R.Colors.separatorColor, andHeight: 1)
    }
    
    func allWorkoutsButtonAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addAdditingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverviewNavBar {
    
    override func setupViews() {
        super.setupViews()
        [titleLabel, allWorkoutsButton, addButton, weekView].forEach {addView($0)}
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),

            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
        
        titleLabel.text = "Today"
        titleLabel.textColor = R.Colors.navGreyTitle
        titleLabel.font = Resources.Fonts.helveticaBold(with: 22)
        
        addButton.setImage( R.Pictures.NavBar.Common.add, for: .normal)
        
    }
    
}
@objc
extension OverviewNavBar {
}

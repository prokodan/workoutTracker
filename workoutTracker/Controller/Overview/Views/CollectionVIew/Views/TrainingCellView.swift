//
//  TrainingCellView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 14.04.2023.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, none
}

final class TrainingCellView: UICollectionViewCell {
    
    static let id = "SectionHeaderView"
    
    private let checkMarkView: UIImageView = {
        let view = UIImageView()
        view.image = R.Pictures.Controller.Overview.checkmarkEmpty
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.navGreyTitle
        label.textAlignment = .left
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaLight(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let rightArrow: UIImageView = {
        let view = UIImageView()
        view.image = R.Pictures.Controller.Overview.rightArrow
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
        configureAppearance()
        
    }
    
    func configure(with title: String, and subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subtitle.text = subtitle
        checkMarkView.image = isDone ? R.Pictures.Controller.Overview.checkmarkFilled : R.Pictures.Controller.Overview.checkmarkEmpty
        switch roundedType {
        case .top:
            self.roundCorners(with: 5, and: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        case .bottom:
            self.roundCorners(with: 5, and: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,])
        case .all:
            self.roundCorners(with: 5, and: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
        case .none:
            break
        }
    }
}

private
extension TrainingCellView {
    
     func setupViews() {
         [
            title,
          subtitle
         ].forEach {stackView.addArrangedSubview($0)}
         
        [
            checkMarkView,
            stackView,
            rightArrow
        ].forEach { addView($0)}
    }
    
     func constraintViews() {

        NSLayoutConstraint.activate([
            checkMarkView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            checkMarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMarkView.heightAnchor.constraint(equalToConstant: 28),
            checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrow.leadingAnchor, constant: -15),
            
            rightArrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrow.heightAnchor.constraint(equalToConstant: 12),
            rightArrow.widthAnchor.constraint(equalToConstant: 7),
            
        ])
    }
    
     func configureAppearance() {
         backgroundColor = UIColor.white
         layer.borderWidth = 1
         layer.borderColor = R.Colors.separatorColor.cgColor
     }
}


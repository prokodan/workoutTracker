//
//  BaseInfoView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

class BaseInfoView: BaseView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = R.Colors.separatorColor.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
}

@objc
extension BaseInfoView {
    
    override func addViews() {
        super.addViews()
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
    }
    
    override func configureView() {
        super.configureView()
        backgroundColor = .clear
    }
}

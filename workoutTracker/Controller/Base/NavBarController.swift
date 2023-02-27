//
//  NavBarController.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.navGrayTitle,
            .font: R.Fonts.helveticaRegular(with: 17)]
        navigationBar.addBottomBorder(withColor: R.Colors.separatorColor, andHeight: 1)
        
    }
}

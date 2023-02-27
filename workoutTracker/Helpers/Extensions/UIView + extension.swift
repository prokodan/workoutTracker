//
//  UIView + extension.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 27.02.2023.
//

import UIKit

extension UIView {
    func addBottomBorder(withColor color: UIColor, andHeight height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpOutside,
            .touchUpInside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc
    func handleIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        }
    }
    @objc
    func handleOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        }
    }
}

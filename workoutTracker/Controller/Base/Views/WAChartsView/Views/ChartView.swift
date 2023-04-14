//
//  ChartView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 14.04.2023.
//

import UIKit

final class ChartView: WABaseView {
    
    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separatorColor
        return view
    }()
    
    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separatorColor
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        layoutIfNeeded()
        addDashLines()

        
    }
}

extension ChartView {
    
    override func setupViews() {
        super.setupViews()
        [
            xAxisSeparator,
            yAxisSeparator
        ].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.heightAnchor.constraint(equalToConstant: 1),

        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

private
extension ChartView {
    
    func addDashLines(with count: Int? = nil) {
        (0..<9).map {CGFloat($0)}.forEach {
            addDashLine(at: bounds.height / 9 * $0)
        }
    }
    
    func addDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let finishPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, finishPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = R.Colors.separatorColor.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
}

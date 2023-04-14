//
//  WAChartsView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 14.04.2023.
//


import UIKit

extension WAChartsView {
    struct Data {
        let title: String
        let value: Int
    }
}

final class WAChartsView: WABaseView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()
    
    func configure(with data: [WAChartsView.Data], topChartOffset: Int) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data, topChartOffset: topChartOffset)
    }
}

extension WAChartsView {
    
    override func setupViews() {
        super.setupViews()
        [
            yAxisView,
            xAxisView,
            chartView
        ].forEach { addView($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([

            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor, constant: -2),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 8),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 4),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16),
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -20),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
        
    }
}


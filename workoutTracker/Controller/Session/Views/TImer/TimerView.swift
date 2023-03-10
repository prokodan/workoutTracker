//
//  TimerView.swift
//  workoutTracker
//
//  Created by Данил Прокопенко on 01.03.2023.
//

import UIKit

enum TimerState {
    case isRunning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let progressView = ProgressView()
    private var timer = Timer()
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Controllers.Session.elapsedTime
        label.font = R.Fonts.helveticaLight(with: 14)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    private let elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 46)
        label.textColor = R.Colors.navGreyTitle
        label.textAlignment = .center
        return label
    }()
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Controllers.Session.remainingTime
        label.font = R.Fonts.helveticaLight(with: 13)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.navGreyTitle
        label.textAlignment = .center
        return label
    }()
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    private let completedPercentView = TimerPercentView()
    private let remainingPercentView = TimerPercentView()
    private let percentSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separatorColor
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 24
        return view
    }()
    
    
    
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var timerState: TimerState = .isStopped
    var callBack: (() -> Void)?
    
    func configure(with duration: Double, and progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        
        let goalValueDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDivider
        let percentRounded = Int(round(percent * 100))
        
        elapsedTimeValueLabel.text = getDisplayedString(for: Int(tempCurrentValue))
        remainingTimeValueLabel.text = getDisplayedString(for: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configure(with: R.Strings.Controllers.Session.completedPercent.uppercased(), and: percentRounded)
        remainingPercentView.configure(with: R.Strings.Controllers.Session.remainingPercent.uppercased(), and: 100 - percentRounded)
        
        progressView.drawProgress(with: CGFloat(percent))
        
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.callBack?()
            }
            
            self.configure(with: self.timerDuration, and: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.02
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, and: self.timerProgress)
        })
    }
    
    
}

extension TimerView {
    
    override func setupViews() {
        super.setupViews()
        
        [
         progressView,
         timeStackView,
         bottomStackView
        ].forEach { addView($0) }
        
        [
            elapsedTimeLabel,
            elapsedTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach {
        timeStackView.addArrangedSubview($0)
         
        [
            completedPercentView,
            percentSeparatorView,
            remainingPercentView
        ].forEach { bottomStackView.addArrangedSubview($0) }
        }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 192),
            
            percentSeparatorView.widthAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}

private extension TimerView {
    
    func getDisplayedString(for value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursdStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
        ? [minutesStr, secondsStr].joined(separator: ":")
        : [hoursdStr, minutesStr, secondsStr].joined(separator: ":")
    }
}

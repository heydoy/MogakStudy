//
//  AgeSpanView.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/21.
//

import UIKit
import Then
import SnapKit
import MogakStudyUIFramework
import MultiSlider

class AgeSpanView: UIView {
    // MARK: Lifecycle
    
    public init() {
        super.init(frame: .zero)
        setUpViews()
        setUpConstraints()
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public
    
    public var text: String? {
        get { return label.text }
        set { label.text = newValue}
    }
    
    
    // MARK: Private
    
    private let label = UILabel().then {
        $0.text = "상대방 연령대"
        $0.font = .Title4_R14
        $0.textColor = .msColor.black

    }
    private let ageLabel = UILabel().then {
        $0.text = "18-65"
        $0.font = .Title3_M14
        $0.textColor = .msColor.brandGreen
    }
    private let slider = MultiSlider().then {
        $0.minimumValue = 18
        $0.maximumValue = 65
        $0.value = [18, 65]
        $0.thumbImage = UIImage(named: "filter_control")
        $0.outerTrackColor = .msColor.gray002
        $0.tintColor = .msColor.brandGreen
        $0.orientation = .horizontal
        $0.trackWidth = 4
    }
    
    private func setUpViews() {
        setUpLabel()
        setUpSwitchView()
    }
    
    private func setUpLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        addSubview(label)
        
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged) // continuous changes
        slider.addTarget(self, action: #selector(sliderDragEnded), for: . touchUpInside) // sent when drag ends
    }
    @objc
    func sliderDragEnded(slider: MultiSlider) {
        
    }
    
    @objc
    func sliderChanged(slider: MultiSlider) {
        print("thumb \(slider.draggedThumbIndex) moved")
        print("now thumbs are at \(slider.value)") // e.g., [1.0, 4.5, 5.0]
        ageLabel.text = "\(Int(slider.value[0]))-\(Int(slider.value[1]))"
    }
    
    private func setUpSwitchView() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(ageLabel)
        addSubview(slider)
    }
    

    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            ageLabel.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: 16),
            ageLabel.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            slider.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 13),
            slider.heightAnchor.constraint(equalToConstant: 24),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

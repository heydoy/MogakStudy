//
//  setFont.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/08.
//

import UIKit

enum NotoSansStyle: String {
    case regular = "NotoSansCJKkr-Regular"
    case medium = "NotoSansCJKkr-Medium"
}

extension UIFont {
    // Title
    static var Onboarding_M24: UIFont { customFont(NotoSansStyle.medium.rawValue, size: 24)}
    static var Onboarding_R24: UIFont { customFont(NotoSansStyle.regular.rawValue, size: 24)}
    
    static var Display1_R20: UIFont { customFont(NotoSansStyle.regular.rawValue, size: 20.0) }
    static var Title1_M16: UIFont {
        customFont(NotoSansStyle.medium.rawValue, size: 16.0) }
    static var Title2_R16: UIFont { customFont(NotoSansStyle.regular.rawValue, size: 16.0) }
    static var Title3_M14: UIFont {
        customFont(NotoSansStyle.medium.rawValue, size: 14) }
    static var Title4_R14: UIFont { customFont(NotoSansStyle.regular.rawValue, size: 14) }
    static var Title5_M12: UIFont {
        customFont(NotoSansStyle.medium.rawValue, size: 14) }
    static var Title6_R12: UIFont { customFont(NotoSansStyle.regular.rawValue, size: 12.0) }
    
    // Body
    static var Body1_M16: UIFont  {
        customFont(NotoSansStyle.medium.rawValue, size: 16.0) }
    static var Body2_R16: UIFont  { customFont(NotoSansStyle.regular.rawValue, size: 16.0) }
    static var Body3_R14: UIFont  { customFont(NotoSansStyle.regular.rawValue, size: 14.0) }
    static var Body4_R12: UIFont  { customFont(NotoSansStyle.regular.rawValue, size: 12.0) }
    
    // Caption
    static var caption_R10: UIFont  { customFont(NotoSansStyle.regular.rawValue, size: 10.0) }
    
    /// 커스텀 폰트를 설정하는 메서드
    private static func customFont(
        _ name: String, size: CGFloat,
        style: UIFont.TextStyle? = nil,
        scaled: Bool = false ) -> UIFont {
            guard let font = UIFont(name: name, size: size) else {
                print("Warning: Font '\(name)' not found.")
                return UIFont.systemFont(ofSize: size, weight: .regular)
            }
            
            if scaled, let style = style {
                let metrics = UIFontMetrics(forTextStyle: style)
                return metrics.scaledFont(for: font)
            } else {
                return font
            }
        }
}

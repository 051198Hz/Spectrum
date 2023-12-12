//
//  File.swift
//  spacelog_MVVM
//
//  Created by iOS Dev on 2023/11/07.
//

import UIKit

@IBDesignable
class BodyMedium16_Label: Label_TMB {
    
    override func setAttributedText() {
        super.setAttributedText()
        font = UIFont(name: "Pretendard-Medium", size: font_size)
        letter_spacing = -0.2
    }
    
    @IBInspectable public var font_size : CGFloat = 16
    
}

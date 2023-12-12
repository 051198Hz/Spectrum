//
//  File.swift
//  spacelog_MVVM
//
//  Created by iOS Dev on 2023/11/07.
//

import UIKit

@IBDesignable
class Body12_Label: Label_TMB {
    
    override func setAttributedText() {
        super.setAttributedText()
        let _font = UIFont(name: "Pretendard-Regular", size: font_size)
        font = _font
        letter_spacing = -0.2
        pxLineHeight = 20
    }
    
    @IBInspectable public var font_size : CGFloat = 12
    
}

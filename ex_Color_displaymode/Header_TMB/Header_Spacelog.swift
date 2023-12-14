//
//  File.swift
//  spacelog_MVVM
//
//  Created by iOS Dev on 2023/11/07.
//

import UIKit
import SnapKit

@IBDesignable
class Header_Spacelog: XibView {
    
    @IBOutlet var NavBar: UINavigationBar!
    @IBOutlet weak var label_Header: Heading_Label!
    
    @IBInspectable public
    var text_header : String?{
        didSet{
            label_Header.text = text_header
        }
    }
    
    @IBInspectable public
    var BorderColor : UIColor?{
        didSet{
            NavBar.standardAppearance.shadowImage = BorderColor!.as1ptImage()
//            NavBar.addBottomBorderWithColor(color: BorderColor!, width: 1)
        }
    }
    
    override func setUI(){
        if #available(iOS 13.0, *) {
            NavBar.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.right.equalToSuperview()
                $0.left.equalToSuperview()
            }
            NavBar.standardAppearance.backgroundColor = .clear
            NavBar.standardAppearance.backgroundEffect = .none
            backgroundColor = .clear
        }
    }
}

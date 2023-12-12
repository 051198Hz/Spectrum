//
//  SlidesNumberIndicatorView.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/12/12.
//

import UIKit
import SnapKit

class SlidesNumberIndicatorView: UIView {
    
    var numberLabel: Body12_Label!
    var count: Int = 0{
        didSet{
            numberLabel.text = "\(count)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(named: "secondaryFill")
        layer.cornerRadius = 14
        setUI()
    }
    
    func setUI(){
        numberLabel = Body12_Label()
        numberLabel.text = "1/4"
        numberLabel.textColor = UIColor(named: "invertedText")
        addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self) // X축 중앙을 changeView와 맞춘다.
            make.centerY.equalTo(self) // X축 중앙을 changeView와 맞춘다.
        }
    }
    
}

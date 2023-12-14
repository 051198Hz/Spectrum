//
//  RoundBorderBox_TMB.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/12/12.
//

import UIKit

class RoundBorderBox_TMB: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor(named: "border2")!.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor(named: "border2")!.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16
        // Initialization code
    }
    
    
}

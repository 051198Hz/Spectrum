//
//  ChipsLabel.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/12/12.
//




import UIKit

class ChipsLabel: Label_TMB, Switchable{
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.3
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
    }
    
    public var font_size : CGFloat? = 12

    var onoff: Bool = false
    
    @IBInspectable var topInset: CGFloat = 2.0
    @IBInspectable var bottomInset: CGFloat = 2.0
    @IBInspectable var leftInset: CGFloat = 8.0
    @IBInspectable var rightInset: CGFloat = 8.0
    
    @IBInspectable var roundConer : CGFloat = 10 {
        didSet{
            layer.masksToBounds = true
            layer.cornerRadius = roundConer
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundConer = 8
        backgroundColor = UIColor(named: "PrimaryFill")
    }
    
    override func setAttributedText() {
        super.setAttributedText()
        let _font = UIFont(name: "Pretendard-Regular", size: font_size!)
        font = _font
        letter_spacing = -0.2
        pxLineHeight = 24
        textColor = UIColor(named: "invertedText")
    }
    
    public override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    public override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
    
    func setOn(){
        textColor = UIColor(named: "invertedText")
        backgroundColor = UIColor(named: "PrimaryFill")
        layer.borderWidth = 0
        onoff = true
    }
    
    func setOff(){
        textColor = UIColor(named: Constants.Assetname.Colors.Text.Secondary)
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: Constants.Assetname.Colors.Border.Border3)?.cgColor
        onoff = false
    }
}

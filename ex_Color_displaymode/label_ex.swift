//
//  label_ex.swift
//  animation_ex
//
//  Created by iOS Dev on 2023/09/15.
//

import UIKit

@IBDesignable
class label_ex: UILabel {
    
    var attributes : [NSAttributedString.Key: Any]? = [:]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAttributedText()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setAttributedText()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setAttributedText()
    }
    
    override func prepareForInterfaceBuilder() {
        setAttributedText()
    }
    
    func setAttributedText(){
        let attrString = NSAttributedString(string: text ?? "",
                                            attributes: attributes)
        self.attributedText = attrString
    }
    
    @IBInspectable
    var letter_spacing : CGFloat = -0.5 {
        didSet{
            attributes?.updateValue(letter_spacing, forKey: .kern)
        }
    }

        
    @IBInspectable
    var lineHeight : CGFloat = 0.0 {
        didSet{
            let style = NSMutableParagraphStyle()

            let pxLineHeight : CGFloat = round( (lineHeight / 100) * self.font.pointSize )
            
            style.maximumLineHeight = pxLineHeight
            style.minimumLineHeight = pxLineHeight
                        
            // [iOS 특정 버전 이상 분기 처리 사용]
            if #available(iOS 16.4, *) {
                attributes?.updateValue(style, forKey: .paragraphStyle)
                attributes?.updateValue((pxLineHeight - font.lineHeight) / 2, forKey: .baselineOffset)
            }
            else {
                attributes?.updateValue(style, forKey: .paragraphStyle)
                attributes?.updateValue((pxLineHeight - font.lineHeight) / 4, forKey: .baselineOffset)
            }
            
//            print(".font.lineHeight", self.font.lineHeight)
//            print(".font.pointSize", self.font.pointSize)
//            print(".intrinsicContentSize.height", self.intrinsicContentSize.height)
//            print("pxLineHeight", pxLineHeight)

        }
    }
    
    @IBInspectable
    var underline : Bool = false {
        didSet{
            if underline {
                attributes?.updateValue(NSUnderlineStyle.single.rawValue, forKey: .underlineStyle)
            }
        }
    }
    
    
}

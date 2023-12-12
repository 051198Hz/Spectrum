//
//  CellSpectrum.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/12/12.
//

import UIKit

class CellFeedSpectrum: UICollectionViewCell {
    
    @IBOutlet weak var image_profile: UIImageView!
    
    @IBOutlet weak var box_post: UIView!
    @IBOutlet weak var thumb_imageView: UIImageView!
    @IBOutlet weak var bodyText: Body12_Label!
    @IBOutlet weak var showMoreText: BodyMedium12_Label!
    
    @IBOutlet weak var tag1TextLabel: BodyMedium12_Label!
    @IBOutlet weak var tag2TextLabel: BodyMedium12_Label!
    @IBOutlet weak var tag3TextLabel: BodyMedium12_Label!
    
    @IBOutlet weak var userNameText: BodyMedium12_Label!
    @IBOutlet weak var userHandleNameText: Body12_Label!
    @IBOutlet weak var agoText: Body12_Label!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        box_post.layer.masksToBounds = true
        bodyText.textColor = UIColor(named: "SecondaryText")
        bodyText.numberOfLines = 0
        showMoreText.textColor = UIColor(named: "TertiaryText")
        
        let tagColor = UIColor(named: "AccentText")
        tag1TextLabel.textColor = tagColor
        tag2TextLabel.textColor = tagColor
        tag3TextLabel.textColor = tagColor
        
        userNameText.textColor = UIColor(named: "textprimaryText")
        userHandleNameText.textColor = UIColor(named: "SecondaryText")
        agoText.textColor = UIColor(named: "TertiaryText")
        
//        image_profile.layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1.31, tx: 0, ty: -0.16))

    }

}

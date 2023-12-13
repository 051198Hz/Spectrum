//
//  File.swift
//  spacelog_MVVM
//
//  Created by iOS Dev on 2023/11/07.
//

import UIKit

@IBDesignable
class ChipsBasicOptionLabel: ChipsLabel {
    
    override var font_size: CGFloat?{
        get{
            return 14
        }
        set{
            
        }
    }
    override var topInset: CGFloat{
        get{
            return 4
        }
        set{
            
        }
    }
    override var bottomInset: CGFloat{
        get{
            return 4
        }
        set{
            
        }
    }
    override var leftInset: CGFloat{
        get{
            return 16
        }
        set{
            
        }
    }
    override var rightInset: CGFloat{
        get{
            return 16
        }
        set{
            
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 16
        
    }
}

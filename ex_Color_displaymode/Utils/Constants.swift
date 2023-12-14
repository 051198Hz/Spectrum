//
//  Constants.swift
//  spacelog_MVVM
//
//  Created by iOS Dev on 2023/11/08.
//

import Foundation

struct Constants{
    static let Assetname = Asset_Name.self
    static let Texts = Text.self
    static let heightFeedCell:CGFloat = 531
}

enum Text{
    static let placeHolder = ""
}

enum Asset_Name{
    static let Fonts = Font.self
    static let Colors = Color.self
    static let Images = Image.self
}

enum Font {
    static let Bold = "Pretendard-Bold"
    static let Regular = "Pretendard-Regular"
    static let Medium = "Pretendard-Medium"
}

enum Color{
    enum Border{
        static let Border3 = "Border3"
    }
    enum Text{
        static let Primary = "textprimaryText"
        static let Secondary = "SecondaryText"
        static let Inverted = "invertedText"
        static let Tertiary = "TertiaryText"
    }
    enum Content{
        static let Primary = "primaryContent"
        static let Secondary = "secondaryContent"
        static let Tertiary = "tertiaryContent"
    }
    enum FAB{
        static let Primary = "primaryFAB"
        static let Secondary = "secondaryFAB"
    }
    enum Background{
        static let bg1 = "backgroundbg1"
        static let bg2 = "backgroundbg2"
    }
}

enum Image{
    enum Symbol{
        static let ArrowBack = "Symbol_arrow_back"
        static let Notification = "Symbol_notifications"
        static let DropDown = "Symbol_arrow_dropDown"
    }

}




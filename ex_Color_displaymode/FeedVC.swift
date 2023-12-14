//
//  ViewController.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/10/12.
//

import UIKit

#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct VCPreview: PreviewProvider {
        // Device 배열로 여러 개의 디바이스에 적용된 모습을 같이 확인할 수 있습니다.
        // 저는 지금 3가지의 Device를 사용하고 있죠.
    static var devices = ["iPhone SE", "iPhone 11 Pro Max", "iPhone 12"]

    static var previews: some View {
        ForEach(devices, id: \.self) { deviceName in
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabVC")
                                // 익스텐션에서 만든 toPreview() 메서드를 사용하고 있죠!
                .toPreview()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif


class FeedVC: UIViewController{
    
    @IBOutlet weak var headerBar: Header_Spacelog!
    
    @IBOutlet weak var filter1: ChipsBasicOptionLabel!
    @IBOutlet weak var filter2: ChipsBasicOptionLabel!
    @IBOutlet weak var filter3: ChipsBasicOptionLabel!
    
    var filterGroup: RadioGroupingController!
    
    @IBOutlet weak var feedCollectionView: UICollectionView!
    lazy var posts : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        registerNib()
        (feedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
        addLeftBarButton()
        addRightBarButton()
        setFilter()
        setGroup()
    }
    
    func setGroup(){
        let filters:[Switchable] = [filter1, filter2, filter3]
        filter1.text = "llllll"
        filterGroup = RadioGroupingController(filters)
    }
    
    private func registerNib() {
        let nibName = UINib(nibName: "CellFeedSpectrum", bundle: nil)
        feedCollectionView.register(nibName, forCellWithReuseIdentifier: "CellFeedSpectrum")
    }
    
    func addRightBarButton(){
        let item_button_search = createBarButtonItem(CGRect(x: 0, y: 0, width: 24, height: 24), Constants.Assetname.Images.Symbol.Notification) {
        }
        headerBar.NavBar.topItem?.setRightBarButtonItems([ item_button_search], animated: true)
    }
    
    func addLeftBarButton(){
        let item: UIBarButtonItem = (headerBar.NavBar.topItem?.leftBarButtonItems?.first)!
//        print(headerBar.NavBar.topItem?.leftBarButtonItems?.)
//        print(item.customView?.frame.width)
        
        let item_drop_down = createBarDropDownItem(CGRect(x: 0, y: 0, width: 68, height: 32))
        item_drop_down.imageInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        
        headerBar.NavBar.topItem?.setLeftBarButton(item_drop_down, animated: true)
//        headerBar.NavBar.topItem?.setLeftBarButton(item, animated: true)
        let negativeLefPadding = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        negativeLefPadding.width = 45 + 8


        headerBar.NavBar.topItem?.setLeftBarButtonItems([item, negativeLefPadding, item_drop_down], animated: true)

    }
    
    func createBarButtonItem(_ frame : CGRect, _ image : String, _ action : @escaping ()->() ) -> UIBarButtonItem {
        let button = Button_Header_Item(frame: frame, image: UIImage(named: image), title: nil)
        button.addAction {
            action()
        }
        return UIBarButtonItem(customView: button )
    }
    
    func createBarDropDownItem(_ frame : CGRect ) -> UIBarButtonItem {
        let dropDownMenu = DropDownMenu(frame: frame, screen: view)

        return UIBarButtonItem(customView: dropDownMenu )
    }
    

}

extension FeedVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 11
        
//        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellFeedSpectrum", for: indexPath) as! CellFeedSpectrum
        
        return cell
    }
    
    func setFilter(){
        filter1.setOn()
        filter2.setOff()
        filter3.setOff()
    }
}

extension FeedVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 448)
        
    }
}


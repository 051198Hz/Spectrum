//
//  ViewController.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/10/12.
//

import UIKit

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
        addBarButton()
        setFilter()
        setGroup()
    }
    
    func setGroup(){
        let filters:[Switchable] = [filter1, filter2, filter3]
        filterGroup = RadioGroupingController(filters)
    }
    
    private func registerNib() {
        let nibName = UINib(nibName: "CellFeedSpectrum", bundle: nil)
        feedCollectionView.register(nibName, forCellWithReuseIdentifier: "CellFeedSpectrum")
    }
    
    func addBarButton(){
        let item_button_search = createBarButtonItem(CGRect(x: 0, y: 0, width: 24, height: 24), Constants.Assetname.Images.Symbol.Notification) {
            print(#function)
        }
        headerBar.NavBar.topItem?.setRightBarButtonItems([ item_button_search], animated: true)
    }
    
    func createBarButtonItem(_ frame : CGRect, _ image : String, _ action : @escaping ()->() ) -> UIBarButtonItem {
        let button = Button_Header_Item(frame: frame, image: UIImage(named: image), title: nil)
        button.addAction {
            action()
        }
        return UIBarButtonItem(customView: button )
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

//
//  ViewController.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/10/12.
//

import UIKit

class FeedVC: UIViewController{
    @IBOutlet weak var feedCollectionView: UICollectionView!
    lazy var posts : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        registerNib()
        (feedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
    }
    
    private func registerNib() {
        let nibName = UINib(nibName: "CellFeedSpectrum", bundle: nil)
        feedCollectionView.register(nibName, forCellWithReuseIdentifier: "CellFeedSpectrum")
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
}

extension FeedVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var margin: CGFloat = 0.0
        if indexPath.row == 10 {
            margin = 16
        }
        return CGSize(width: collectionView.frame.width, height: 448)
        
    }
}

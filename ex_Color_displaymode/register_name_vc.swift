//
//  register_name_vc.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/10/25.
//

import UIKit

class register_name_vc: UIViewController {
    
    var v = UILabel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let nbar = navigationController?.navigationBar, nbar.subviews.count > 0 {
            v = UILabel(frame: nbar.subviews[1].bounds)
            v.text = "test 하는 중이라규"
            v.textAlignment = .center
            v.font = UIFont(name: "Pretendard-Medium", size: 20)!
        //            v.backgroundColor = UIColor.red
            v.translatesAutoresizingMaskIntoConstraints = true
            v.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            nbar.subviews[1].insertSubview(v, at: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSet()

        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        v.removeFromSuperview()
    }
    
    func titleSet(){
        navigationController?.navTitleSet(title: "시작하기")

    }
    
    @IBAction func pressed_button(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ViewController3") else{return}
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UINavigationController {
    
    func navTitleSet(title : String?){
        
        let yourBackImage = UIImage(named: "Symbol_arrow_back")!.withAlignmentRectInsets(UIEdgeInsets(top: 0.0, left: -6.0, bottom: 0.0, right: 0.0))
        
        self.navigationBar.backIndicatorImage = yourBackImage
//        self.navigationBar.topItem?.title = ""
        self.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        
        guard let titleStr = title else { return }
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Pretendard-Medium", size: 20)!,NSAttributedString.Key.kern: -0.5]
        self.navigationBar.topItem?.prompt? = titleStr
//        self.title = title
//        UINavigationBar.layerClass.removeAllAnimations()
//        self.navigationBar.layer.removeAllAnimations()
    }
}

//
//  ViewController2.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/10/25.
//

import UIKit

class ViewController2: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        


    }
        
    @IBAction func pressed_button(_ sender: Any) {
        
        guard let VC = storyboard?.instantiateViewController(identifier: "register_name_vc") else {return}
        
        navigationController?.pushViewController(VC, animated: true)
        
    }

}

extension ViewController2 : UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .none: break
        case .push: return CustomTransition(isPresenting: operation == .push)
        case .pop:  return CustomTransition(isPresenting: operation == .pop
        )
        @unknown default: break
        }
        return nil
    }
    
}

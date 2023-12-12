//
//  navVC.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/10/25.
//

import UIKit

class navVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.layer.removeAllAnimations()
        // Do any additional setup after loading the view.
    }
    
}

class naItem : UINavigationItem{
    override func setLeftBarButtonItems(_ items: [UIBarButtonItem]?, animated: Bool) {
        super.setLeftBarButtonItems(items, animated: false)
    }
}

class barItem : UIBarButtonItem{
}



class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {

    private let duration: TimeInterval
    private let isPresenting: Bool

    init(duration: TimeInterval = 0.2, isPresenting: Bool) {
        self.duration = duration
        self.isPresenting = isPresenting
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        guard
            let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from),
            let toView = transitionContext.view(forKey: .to),
            let fromView = transitionContext.view(forKey: .from)
        else {
            return
        }

        let rightTranslation = CGAffineTransform(translationX: container.frame.width, y: 0)
        
        let leftTranslation = CGAffineTransform(translationX: -container.frame.width, y: 0)
        
        let navTranslation = CGAffineTransform(translationX: 0, y: 0)
        
        toView.transform = isPresenting ? rightTranslation : leftTranslation

        container.addSubview(toView)
        container.addSubview(fromView)

        fromVC.navigationController?.navigationBar.backgroundColor = .clear
//        fromVC.navigationController?.navigationBar.setBackgroundImage(UIImage.fromColor(color: .clear), for: .default)

        UIView.animate(
            withDuration: self.duration,
            animations: {
                fromVC.view.transform = self.isPresenting ? leftTranslation :rightTranslation
                fromVC.navigationController?.navigationBar.topItem?.titleView?.transform = navTranslation
                toVC.view.transform = .identity
                toVC.navigationController?.navigationBar.topItem?.titleView?.transform = navTranslation
            },
            completion: { _ in
//                fromView.inputAccessoryViewController?.navigationController?.navigationBar.transform = .identity
                fromView.transform = .identity
//                toVC.navigationController?.navigationBar.setBackgroundImage(
//                    UIImage.fromColor(color: self.isPresenting ? .yellow : .lightGray),
//                    for: .default
//                )
                transitionContext.completeTransition(true)
            }
        )
    }
}

class PopTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval { 0.3 }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let to   = transitionContext.viewController(forKey: .to),
            let from = transitionContext.viewController(forKey: .from)
        else { return }
        
        //  Добавляем вьюху
        let container = transitionContext.containerView
        container.insertSubview(to.view, belowSubview: from.view)
        
        //  Положение
        let width = transitionContext.initialFrame(for: from).width
        
        //  Анимируем
        UIView.animateKeyframes(
            withDuration: self.transitionDuration(using: transitionContext),
            delay: 0.0,
            options: [],
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.1,
                    animations: {
                        from.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                    }
                )
                UIView.addKeyframe(
                    withRelativeStartTime: 0.1,
                    relativeDuration: 0.9,
                    animations: {
                        from.view.frame.origin.x = width
                    }
                )
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }
}


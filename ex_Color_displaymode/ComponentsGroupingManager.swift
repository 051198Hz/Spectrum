//
//  ComponentsGroupingManager.swift
//  ex_Color_displaymode
//
//  Created by iOS Dev on 2023/12/13.
//

import Foundation
import UIKit

protocol Switchable{
    var onoff: Bool { get set }
    func setOn()
    func setOff()
}

class RadioGroupingController{
    
    private var _array:[Switchable] = []

    private var array:[Switchable]{
        get{
            return _array
        }
        set{
            _array = newValue
        }
    }
    
    init(_ newArry:[Switchable] ){
        registerComponents(newArry)
    }
    
    func registerComponents(_ newArry:[Switchable]){
        newArry.forEach({
            let tapedComponents = addTapGesture($0)
            self.array.append(tapedComponents)
        })
    }
    
    private func addTapGesture(_ newComponents: Switchable ) -> Switchable{
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSeletedComponents(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        (newComponents as? UIView)?.addGestureRecognizer(tapGestureRecognizer)
        (newComponents as? UIView)?.isUserInteractionEnabled = true
        return newComponents
    }
    
    @objc private func didSeletedComponents(_ sender: UITapGestureRecognizer) {
        for index in array.indices {
            guard let item = array[index] as? UIView else {return}
            if item != sender.view{
                array[index].setOff()
            }
        }
        guard let item = sender.view as? Switchable else {return}
        item.setOn()

    }
    
}

//
//  Avatar.swift
//  lesson-4
//
//  Created by LACKY on 17.09.2021.
//

import UIKit

//@IBDesignable
class Avatar: UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.Shadow()
    }
    
    private func Shadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .init(width: 5, height: -5)
        self.layer.shadowOpacity = 0.15
    }
    
}

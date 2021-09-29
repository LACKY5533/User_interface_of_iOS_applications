//
//  R.swift
//  lesson-3
//
//  Created by LACKY on 12.09.2021.
//

import UIKit

enum R {
    
    enum Storyboard {
    static let DebugMenu: UIStoryboard = .init(name: "DebugMenu", bundle: nil)
    }
    
    enum Nib {
        static let basic: UINib = .init(nibName: "BasicTableViewCell", bundle: nil)
    }
    
    enum Cell {
        static let basic: String = "BasicCell"
    }
}

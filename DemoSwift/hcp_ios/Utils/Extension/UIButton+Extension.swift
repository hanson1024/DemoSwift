//
//  UIButton+Extension.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/12.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

typealias Action = ()->()

extension UIButton {
    
    convenience init (title: String, fontSize: CGFloat, normalColor: UIColor, highlightedColor: UIColor) {
        
        self.init(type: .custom)
        
        if title.count > 0 {
            self.setTitle(title, for: .normal)
        }
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        self.setTitleColor(normalColor, for: .normal)
        self.setTitleColor(highlightedColor, for: .highlighted)
        self.sizeToFit()
    }
    
    convenience init (title: String, fontSize: CGFloat, normalColor: UIColor = UIColor.white) {
        
        self.init(type: .custom)
        
        if title.count > 0 {
            self.setTitle(title, for: .normal)
        }
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        self.setTitleColor(normalColor, for: .normal)
        
        self.sizeToFit()
        
        
        
    }
    
    
}



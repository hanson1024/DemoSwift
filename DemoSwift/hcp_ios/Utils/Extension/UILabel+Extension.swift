//
//  UILabel+Extension.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/14.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init (fontSize: CGFloat, textColor: UIColor,alignment: NSTextAlignment) {
        
        self.init()
        
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.textAlignment = alignment
        
    }
    
}

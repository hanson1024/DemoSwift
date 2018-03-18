//
//  HCConfirmButton.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/9.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCConfirmButton: UIButton {
    
    var didClickCall: (() -> Void )?
    
    class func addToView(view: UIView, y: Float,title: String,color: UIColor,isBottom: Bool = true, didClickCall: @escaping (() -> Void )) {
        
        let distance: CGFloat = isBottom ? view.frame.size.height - 44 - CGFloat(y) : CGFloat(y)
        
        let button = HCConfirmButton()
        unowned let weakButton = button
        button.addTarget(weakButton, action: #selector(didClickbutton(_:)), for: .touchUpInside)
        button.didClickCall = didClickCall
        button.frame = CGRect(x: 15, y: distance, width: kScreenWidth - 30, height: 44)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        view.addSubview(button)
    }
    
    @objc func didClickbutton(_ button: HCConfirmButton) {
        
        if button.didClickCall != nil {
            
            button.didClickCall!()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
       
    }
}

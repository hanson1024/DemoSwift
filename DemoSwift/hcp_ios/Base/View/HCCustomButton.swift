//
//  HCCustomButton.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/14.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCCustomButton: UIButton {

    var didClickCall: (() -> Void )?
    
    class func create(title: String,fontSize: CGFloat = 15, color: UIColor = UIColor.white, didClickCall: @escaping (() -> Void )) -> HCCustomButton {
        
        let button = HCCustomButton()
        unowned let weakButton = button
        button.addTarget(weakButton, action: #selector(didClickbutton(_:)), for: .touchUpInside)
        button.didClickCall = didClickCall
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.sizeToFit()
        
        return button
    }
    
    class func createByImage(image: String, didClickCall: @escaping (() -> Void )) -> HCCustomButton {
        
        let button = HCCustomButton()
        unowned let weakButton = button
        button.addTarget(weakButton, action: #selector(didClickbutton(_:)), for: .touchUpInside)
        button.didClickCall = didClickCall
        button.setImage(UIImage.init(named: image), for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.sizeToFit()
        
        return button
    }
    
    @objc func didClickbutton(_ button: HCConfirmButton) {
        
        if button.didClickCall != nil {
            
            button.didClickCall!()
        }
    }

}

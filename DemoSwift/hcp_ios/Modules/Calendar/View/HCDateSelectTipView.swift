//
//  HCDateSelectTipView.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/14.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCDateSelectTipView: UIView {
    
    var dateString = String() {
        
        didSet{
            
            tipLabel?.text = dateString
        }
    }
    
    var tipLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let height = 24.0
        
        tipLabel = UILabel(fontSize: 17, textColor: UIColor.init(hexString: "#999999")!, alignment: .left)
        tipLabel?.frame = CGRect(x: 15.0, y: (44.0 - height) * 0.5, width: Double(kScreenWidth - 30), height: height)
        tipLabel?.text = "已选择日期: "
        
        backgroundColor = UIColor.init(hexString: "#F2F2F2")
        
        self.addSubview(tipLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

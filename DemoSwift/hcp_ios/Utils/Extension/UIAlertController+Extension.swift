//
//  UIAlertController+Extension.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/14.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

typealias AlertActionType = (UIAlertAction?)->()

extension UIAlertController {
    
    class func showAlert(title: String,message: String) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        return alertController
    }
    
    func cancleHandle(title:String? = "取消",style: UIAlertActionStyle? = .cancel,alertAction: AlertActionType?) -> UIAlertController {
        
        let alert = UIAlertAction(title: title, style: style!) { (action) in
            if alertAction != nil{
                alertAction!(action)
            }
        }
        
        self.addAction(alert)
        
        return self
    }
    
    func otherHandle(title: String? = "确定",style: UIAlertActionStyle? = .default,alertAction: AlertActionType?) -> UIAlertController {
        
        let alert = UIAlertAction(title: title, style: style!) { (action) in
            if alertAction != nil{
                alertAction!(action)
            }
        }
        
        self.addAction(alert)
        
        return self
    }
    
    func show(superViewController: UIViewController)  {
        
        superViewController.present(self, animated: true, completion: nil)
        
    }
}

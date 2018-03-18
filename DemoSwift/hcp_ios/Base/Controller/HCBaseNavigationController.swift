//
//  HCBaseNavigationController.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCBaseNavigationController: UINavigationController {
    
    var backButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        settingBaseInformation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        if self.childViewControllers.count > 0 {
            
//            if let currentViewController = (viewController as? HCBaseViewController) {
//
////                var title = "返回"
////                if childViewControllers.count == 1 {
////                    title = childViewControllers.first?.title ?? "返回"
////                }
//                currentViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", target: self, action: #selector(popToLastViewController), isBack: true)
//
//            }
            
            if let currentViewController = (viewController as? HCBaseViewController){
                
                backButton = UIButton()
                backButton?.setImage(#imageLiteral(resourceName: "navigation_back"), for: .normal)
                backButton?.sizeToFit()
                backButton?.addTarget(self, action: #selector(popToLastViewController), for: .touchUpInside)
                
                currentViewController.navItem.leftBarButtonItem = UIBarButtonItem(customView: backButton!)
                currentViewController.hidesBottomBarWhenPushed = true
            }
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func settingBaseInformation() {
        
        self.navigationBar.isHidden = true
    }

    @objc func popToLastViewController() {

        self.popViewController(animated: true)
    }

}

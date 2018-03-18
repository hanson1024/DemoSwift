//
//  HCMainTabBarController.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCMainTabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        settingBaseInformation()
        addChildViewControllers()
    }
    
    fileprivate func settingBaseInformation() {
        
        self.tabBar.tintColor = kUIColorCustomBlue()
        self.tabBar.backgroundColor = UIColor.white
        
    }
    
    fileprivate func addChildViewControllers() {
        
        setupChildViewController("首页", image: "home_my", selectedImage: "home_my_selected", controller: HCHomeNavigationController(rootViewController: HCHomeViewController()))
    }
    
    fileprivate func setupChildViewController(_ title: String, image: String, selectedImage: String, controller: UIViewController){
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        addChildViewController(controller)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

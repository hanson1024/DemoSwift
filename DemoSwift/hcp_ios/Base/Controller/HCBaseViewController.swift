//
//  HCBaseViewController.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCBaseViewController: UIViewController {
    
    //表格视图
    var tableView: UITableView?
    
    //自定义导航条
    lazy var navgationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: kStatusBarHeight, width: kScreenWidth, height: kNavBarHeight))
    lazy var statusBar: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusBarHeight))
    lazy var adjustBar: UIView = UIView.init(frame: CGRect(x: 0, y: kScreenHeight - kAdjustBarHeight, width: kScreenWidth, height: kAdjustBarHeight))
    
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }else{
            automaticallyAdjustsScrollViewInsets = false;
        }
        
        settingBaseInformation()
    }
    
    deinit {
        //注销通知
        NotificationCenter.default.removeObserver(self)
        print("deinit")
    }
    
    override var title : String? {
        didSet{
            navItem.title = title
        }
    }
    //加载数据 具体由子类负责
    func loadData() {
        
    }
    
    func back() {
        
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - 设置界面
extension HCBaseViewController {
    
    fileprivate func settingBaseInformation() {
        view.backgroundColor = UIColor.white
        
        settingNavigationBarAndStatusBar()
        settingTableView()
        settingNavigationBarAndStatusBarColor()
    }
    
    //子类重写方法
    private func settingTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        view.insertSubview(tableView!, belowSubview: navgationBar)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.contentInset = UIEdgeInsets(top: kStatusAndNavBarHeight, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        tableView?.tableFooterView = UIView()
        tableView?.separatorStyle = .none
    }
    
    ///设置导航栏
    private func settingNavigationBarAndStatusBar() {
        view.addSubview(navgationBar)
        navgationBar.items = [navItem]
        navgationBar.barTintColor = UIColor.init(hexString: "0xF6F6F6")
        navgationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navgationBar.setBackgroundImage(UIImage.init(), for: .default)
        navgationBar.shadowImage = UIImage.init()
        
        view.addSubview(statusBar)
        statusBar.backgroundColor = navgationBar.barTintColor
        
    }
    
    func settingNavigationBarAndStatusBarColor(color: UIColor = kUIColorCustomBlue()) {
        
        statusBar.backgroundColor = color
        navgationBar.backgroundColor = color
    }
    
    func showAdjustBar() {
        
        view.addSubview(adjustBar)
        statusBar.backgroundColor = UIColor.init(hexString: "0xF6F6F6")
    }
    
}

// MARK: - 代理方法
extension HCBaseViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

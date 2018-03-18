//
//  HCHomeViewController.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCHomeViewController: HCBaseViewController {
    
    let HCHomeDateCellIdentifier = "HCHomeDateCell"
    
    private var departureDate = Date()
    private var selectDates: Array<Date>!
    private var timeModel: HCHomeTimeModel?
    
    // MARK: - lazy loading
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingBaseInformation()
        settingTableView()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - private methods
    
    func settingBaseInformation() {
        
        navItem.title = "Demo list"
        
        DispatchQueue.global().async {
            
            self.selectDates = Array()
            self.timeModel = HCHomeTimeModel()
            
            DispatchQueue.main.async {
                
                self.tableView?.reloadData()
            }
        }
    }
    
    func settingTableView() {
        tableView?.register(UINib.init(nibName: HCHomeDateCellIdentifier, bundle: nil), forCellReuseIdentifier: HCHomeDateCellIdentifier)
        tableView?.backgroundColor = UIColor.white
        tableView?.separatorStyle = .singleLine
    }
    
    func goToCalendar()  {
        
        navigationController?.pushViewController(HCDateViewController(), animated: true)
    }
    
    // MARK: - Delegate
    
    // MARK: - tableViewDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if timeModel != nil {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HCHomeDateCellIdentifier, for: indexPath) as! HCHomeDateCell
        
        cell.timeModel = timeModel!
        cell.didClickCallBack = {[weak self] in
            
            self?.goToCalendar()
        }
        
        return cell
        
    }
    
    
    // MARK: - event response
    
    

}

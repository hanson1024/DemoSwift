//
//  HCDatePickerView.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/9.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCDatePickerView: UIView {
    
    let datePicker = UIDatePicker()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingBaseInformation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingBaseInformation() {
        
        datePicker.locale = NSLocale.init(localeIdentifier: "zh") as Locale
        datePicker.datePickerMode = .date
        datePicker.setDate(Date(), animated: true)
        datePicker.addTarget(self, action: #selector(dateChange(_:)), for: .valueChanged)
        datePicker.frame = self.bounds
        datePicker.backgroundColor = UIColor(red: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1.0)
        
        self.addSubview(datePicker)
    }
    
    @objc func dateChange(_ datePicker:UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年 MM月 dd日"
    }
    
}

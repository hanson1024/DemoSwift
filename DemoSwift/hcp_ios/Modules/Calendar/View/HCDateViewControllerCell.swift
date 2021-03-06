//
//  HCDateViewControllerCell.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/13.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

let HCDateViewControllerCellIdentifier = "HCDateViewControllerCellIdentifier"


class HCDateViewControllerCell: UITableViewCell {
    
    private var statusButton: UIButton?
    private var dateLabel: UILabel?
    private var weekLabel: UILabel?
    private var noteLabel: UILabel?
    
    var dateModel: HCDateModel? {
        
        didSet{
            
            dateLabel?.text = dateModel?.dateString
            weekLabel?.text = dateModel?.dateWeekString
            noteLabel?.isHidden = (dateModel?.showStarSale)! ? false : true
            statusButton?.isSelected = (dateModel?.selectStatus)!
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let statusButtonHeight = 16.0
        statusButton = UIButton(type: .custom)
        statusButton?.setImage(#imageLiteral(resourceName: "date_select"), for: .normal)
        statusButton?.setImage(#imageLiteral(resourceName: "date_select_ed"), for: .selected)
        statusButton?.frame = CGRect(x: 15.0, y: Double(40 - statusButtonHeight) * 0.5, width: statusButtonHeight, height: statusButtonHeight)
        
        let dateLabelHeight = 21.0
        dateLabel = UILabel()
        dateLabel?.font = UIFont.systemFont(ofSize: 15)
        dateLabel?.textColor = UIColor.init(hexString: "#333333")
        dateLabel?.frame = CGRect(x: Double((statusButton?.frame.maxX)!) + 10, y: Double(40 - dateLabelHeight) * 0.5, width: 70, height: dateLabelHeight)
        
        weekLabel = UILabel()
        weekLabel?.font = UIFont.systemFont(ofSize: 15)
        weekLabel?.textColor = UIColor.init(hexString: "#969696")
        weekLabel?.frame = CGRect(x: Double((dateLabel?.frame.maxX)!) + 5, y: Double(40 - dateLabelHeight) * 0.5, width: 40, height: dateLabelHeight)
        
        noteLabel = UILabel()
        noteLabel?.font = UIFont.systemFont(ofSize: 15)
        noteLabel?.textColor = UIColor.init(hexString: "#FC5151")
        noteLabel?.frame = CGRect(x: Double((weekLabel?.frame.maxX)!) + 8, y: Double(40 - dateLabelHeight) * 0.5, width: 50, height: dateLabelHeight)
        noteLabel?.text = "开售"
        
        let lineView = UIView(frame: CGRect(x: 15.0 + statusButtonHeight + 10, y: 39.5, width: Double(kScreenWidth - 15), height: 0.5))
        lineView.backgroundColor = UIColor.init(hexString: "#E6E6E6")
        
        self.contentView.addSubview(statusButton!)
        self.contentView.addSubview(lineView)
        self.contentView.addSubview(dateLabel!)
        self.contentView.addSubview(weekLabel!)
        self.contentView.addSubview(noteLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  HCHomeDateCell.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/12.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit

class HCHomeDateCell: UITableViewCell {
    
    var timeModel = HCHomeTimeModel(){
        
        didSet{
            
            self.textLabel?.text = timeModel.titleName
            self.detailTextLabel?.text = timeModel.detail
        }
    }
    
    var didClickCallBack: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didClickButton))
        tap.numberOfTapsRequired = 1
        
        self.contentView.addGestureRecognizer(tap)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func didClickButton() {
        didClickCallBack!()
    }
    
}

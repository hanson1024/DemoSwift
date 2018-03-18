//
//  DefineSizeFile.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import Foundation
import UIKit

let kScreenBounds = UIScreen.main.bounds;
let kScreenHeight = UIScreen.main.bounds.size.height;
let kScreenWidth = UIScreen.main.bounds.size.width;

let kIphone4 = kScreenHeight  < 568 ? true : false
let kIphone5 = kScreenHeight  == 568 ? true : false
let kIphone6 = kScreenHeight  == 667 ? true : false
let kIphone6P = kScreenHeight == 736 ? true : false
let kIphoneX = kScreenHeight == 812 ? true : false

let kNavBarHeight : CGFloat = 44
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kTabBarHeight : CGFloat = kIphoneX ? 49 + 34 : 49
let kAdjustBarHeight : CGFloat = kIphoneX ? 43 : 0
let kStatusAndNavBarHeight = kStatusBarHeight + kNavBarHeight

let kStationTextWidth = (kScreenWidth - 15 * 2 - 5)/3


//
//  DefineColorFile.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import Foundation
import UIKit

func kUIColorCustomFontGray() -> UIColor {
    return RGBColorFromHex(rgbValue: 0x222222)
}

func kUIColorCustomBlue() -> UIColor {
    return UIColor.init(red: 83 / 255, green: 149 / 255, blue: 230 / 255, alpha: 1)
}

/// 根据RGBA生成颜色(格式为：22,22,22,0.5)
var RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) ->UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}
/// 根据RGB生成颜色(格式为：22,22,22)
var RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}
///// 根据色值生成颜色(无透明度)(格式为0xffffff)
func RGBColorFromHex(rgbValue: Int) -> (UIColor) {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0, alpha: 1.0)
}

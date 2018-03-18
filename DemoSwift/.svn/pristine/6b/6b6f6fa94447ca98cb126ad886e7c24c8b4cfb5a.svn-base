//
//  UIView+Extension.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/15.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// 部分圆角
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    /// 圆角
    func corner(radii: CGFloat) {
        
        let corners: UIRectCorner = [.allCorners]
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    /// 圆角线条
    func corner(radii: CGFloat, lineColor: UIColor) {
        
        let corners: UIRectCorner = [.allCorners]
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        maskLayer.strokeColor = lineColor.cgColor
        maskLayer.fillColor = UIColor.white.cgColor
        maskLayer.lineWidth = 1
        self.layer.addSublayer(maskLayer)
    }
    
    /// 虚线
    func dashedLineView(lineColor: UIColor) {
        
        let dashedLayer: CAShapeLayer = CAShapeLayer()
        
        dashedLayer.frame = self.bounds
        dashedLayer.fillColor = self.backgroundColor?.cgColor
        dashedLayer.strokeColor = lineColor.cgColor
        dashedLayer.lineWidth = self.bounds.height
        dashedLayer.lineJoin = kCALineJoinRound
        dashedLayer.lineDashPhase = 0
        dashedLayer.lineDashPattern = [NSNumber(value: 3), NSNumber(value: 3)]
        
        let path: CGMutablePath = CGMutablePath()
        path.move(to: CGPoint(x: self.frame.origin.x, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width + self.frame.origin.x, y: 0))
        dashedLayer.path = path
        
        self.layer.addSublayer(dashedLayer)
    }
}

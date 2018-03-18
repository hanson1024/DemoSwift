//
//  String+Commen.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/8.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import Foundation

extension String {
    
    func configParametersFormater(name: String) -> String {
        
        return "&" + name + "=" + self
    }
    
    static func loadLocalData(pathName: String) -> String {
        
        let jsonPath = Bundle.main.path(forResource: pathName, ofType: "") ?? ""
        
        guard let data = NSData.init(contentsOfFile: jsonPath) else {
            
            return ""
        }
        
        let jsonString = String.init(data: data as Data, encoding: .utf8) ?? ""
        
        return jsonString
    }
}

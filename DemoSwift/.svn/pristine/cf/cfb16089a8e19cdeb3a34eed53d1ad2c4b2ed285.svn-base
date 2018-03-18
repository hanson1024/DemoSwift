//
//  HCNetworkManager.swift
//  hcp_ios
//
//  Created by Hanson on 2018/3/12.
//  Copyright © 2018年 Hanson. All rights reserved.
//

import UIKit
import AFNetworking

enum HCHttpMethod {
    case GET
    case POST
}

class HCNetworkManager: AFHTTPSessionManager {
    
    static let shared: HCNetworkManager = {
        
        let instance = HCNetworkManager()
        
        return instance
    }()
    
    func request(method: HCHttpMethod = .GET, URLString: String, parameters: [String:AnyObject]?, completion:@escaping (_ json: AnyObject?,_ isSuccess:Bool) -> Void) {
        
        if URLString.hasPrefix("http") == false {
            print("添加完整URL")
            return
        }
        
        let success = { (task: URLSessionDataTask, json: Any?) ->() in
            
            completion(json as AnyObject?, true)
            
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error) ->() in
            
            if (task?.response as? HTTPURLResponse)?.statusCode == 403{
                
                print("网络错误")
                completion(nil,false)
            }
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }else{
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
}

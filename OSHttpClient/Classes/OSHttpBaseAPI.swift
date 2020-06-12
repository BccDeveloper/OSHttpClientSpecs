//
//  OSHttpBaseAPI.swift
//  OSHttpClientDemo
//
//  Created by 张飞 on 2019/5/22.
//  Copyright © 2019 张飞. All rights reserved.
//

import UIKit
import Moya

class OSHttpBaseAPI{
    
    func startHttpRequest() ->Cancellable{
        
        let Provider =  MoyaProvider<OSHttpBaseAPI>()
        let task = Provider.request(OSHttpBaseAPI(), callbackQueue: nil, progress: { (response) in
            
        }) { (result) in
    
        }
        return task
        
    }
    
}

extension OSHttpBaseAPI: TargetType {
    
    internal var baseURL: URL {
        return URL(string: "")!
    }
    
    internal var path: String {
        var path = ""
        if let httpProtocol = self as? OSHttpProtocol {
            path = httpProtocol.OSPath
        }
        return path
    }
    
    internal var method: Moya.Method {
        
        var method:Moya.Method = .get
        if let httpProtocol = self as? OSHttpProtocol {
            method = httpProtocol.OSMethod
        }
        return method
    }
    
    internal var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    internal var task: Task {
        
        var task:Task = .requestPlain
        if let httpProtocol = self as? OSHttpProtocol {
            task = httpProtocol.OSTask
        }
        
        return task
    }
    
    internal var headers: [String : String]? {
        
       let headers = OSHttpCommonParams.getOSHttpCommonHeaderParams()
        
        return headers
    }

}

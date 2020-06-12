//
//  OSHttpUploadBaseAPI.swift
//  OSHttpClientDemo
//
//  Created by 张飞 on 2019/5/22.
//  Copyright © 2019 张飞. All rights reserved.
//

import UIKit
import Moya

class OSHttpUploadAPI:OSHttpBaseAPI{
    
}

extension OSHttpUploadAPI:OSHttpProtocol{
    
    var OSMethod:Moya.Method {
        return .get
    }
    
    var OSPath: String {
        return ""
    }
    
    var OSParameters: [String : Any] {
        return [:]
    }
    
    var OSTask: Task {
        
        let parameters = self.OSParameters
        let multiParams = OSHttpCommonParams.getDefultMutipartFormData(params: parameters)
        
        return .uploadCompositeMultipart(multiParams.0, urlParameters: multiParams.1)
        
    }
  
}

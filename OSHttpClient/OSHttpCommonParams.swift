//
//  OSHttpConfig.swift
//  OSHttpClientDemo
//
//  Created by 张飞 on 2019/5/22.
//  Copyright © 2019 张飞. All rights reserved.
//

import UIKit
import Moya

struct OSHttpCommonParams {
    
}

// 参数相关
extension OSHttpCommonParams{
    
    static func getOSHttpCommonHeaderParams() -> [String:String] {
        
        return [:]
    }
    
}

// 上传相关
extension OSHttpCommonParams{
    
    static func getDefultMutipartFormData(params:[String:Any]) -> ([MultipartFormData],[String:Any]){
        
        var multiParams = params
        
        var multipartData = [MultipartFormData]()
        
        if let url = multiParams["url"] as? String,let fileUrl = URL(string: url),let name = multiParams["name"] as? String,let fileName = multiParams["fileName"] as? String,let mimeType = multiParams["mimeType"] as? String{
        
            let formData = MultipartFormData(provider: .file(fileUrl), name: name, fileName: fileName, mimeType: mimeType)
            
            multipartData.append(formData)
            
            multiParams.removeValue(forKey: "url")
            multiParams.removeValue(forKey: "name")
            multiParams.removeValue(forKey: "fileName")
            multiParams.removeValue(forKey: "mimeType")
            
        }
      
        return (multipartData,multiParams)
    
    }
    
    
    
}

// 下载相关
extension OSHttpCommonParams{
    
    static func getDefultDownloadDestination() -> DownloadDestination{
        
        let defaultDestination:DownloadDestination =  { temporaryURL, response in
            return (DefaultDownloadDir().appendingPathComponent(response.suggestedFilename!), [])
        }
        
        return defaultDestination
        
    }
    
    static func DefaultDownloadDir() -> URL{
        
        let directoryURLs = FileManager.default.urls(for: .documentDirectory,
                                                     in: .userDomainMask)
        return directoryURLs.first ?? URL(fileURLWithPath: NSTemporaryDirectory())
        
    }
    
    
}

//
//  OSHttpProtocol.swift
//  OSHttpClientDemo
//
//  Created by 张飞 on 2019/5/22.
//  Copyright © 2019 张飞. All rights reserved.
//

import UIKit
import Moya

public protocol OSHttpProtocol{
    
    var OSMethod: Moya.Method { get }
    var OSPath: String { get }
    var OSParameters:[String:Any]{ get }
    var OSTask:Task{ get }
    
}

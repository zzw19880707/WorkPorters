//
//  Job.swift
//  WorkPorters
//
//  Created by cnsyl066 on 16/8/31.
//  Copyright © 2016年 佐筱猪. All rights reserved.
//

import UIKit
import LeanCloud

class Job: LCObject {
    dynamic var jobName : LCString!
//    dynamic var jId : Int?
    
    override static func objectClassName() -> String {
        return "job"
    }
}

class JobQuery {
    class func queryAllJobs(complete : ([String]?)-> Void) -> Void {
        let query = LCQuery(className: "job")
        query.find { ( result : LCQueryResult<Job>) in
            if(result.isSuccess){
                // 获取 Todo 数组
                if let todos = result.objects{
                    let array = todos.map({ (job)  in
                        job.jobName.JSONString
                    })
                    complete(array)
                }
            }
            return complete(nil)
        }
    }
}

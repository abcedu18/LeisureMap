//
//  NetWorker.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/26.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import Foundation

protocol AsyncResponseDelegate{
    
    func receivedResponse(_ sender: AsyncRequestWorker, responseString: String, tag:Int)->Void
}
class AsyncRequestWorker{
    
    var responseDelegate:AsyncResponseDelegate?
    
    func getResponse(from:String,tag:Int)->Void{
        let url=URL(string: from)!
        let request=URLRequest(url: url)
        let config=URLSessionConfiguration.default
        let session=URLSession(configuration: config)

        let task=session.dataTask(with: request, completionHandler:{(data,response,error)in

            let httpResponse=response as! HTTPURLResponse
            let statusCode=httpResponse.statusCode
            
            if(200==statusCode){
               let dataString=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)

               let responseString=String(dataString!)

               print(responseString)
                
               self.responseDelegate?.receivedResponse(self, responseString: responseString, tag: tag)
            }
        })
        //print("HERE")
        task.resume()
    }
}

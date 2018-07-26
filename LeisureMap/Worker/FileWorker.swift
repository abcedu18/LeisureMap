//
//  FileWorker.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/26.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import Foundation


protocol FileWorkerDelegate{
    func fileWorkerWriteCompleted(_ sender:FileWorker,fileName:String,tag:Int)
     func fileWorkerReadCompleted(_ sender:FileWorker,fileName:String,tag:Int)
}
class FileWorker{
    
    var fileWorkerDelegate:FileWorkerDelegate?
    
    func writeToFile(content:String,fileName:String,tag:Int){
        if let dir=FileManager.default.urls(for:.documentDirectory,in:.userDomainMask).first{
            let fileURL=dir.appendingPathComponent(fileName)
            do{
                try content.write(to: fileURL, atomically: false, encoding:.utf8)
                self.fileWorkerDelegate?.fileWorkerReadCompleted(self, fileName: fileURL.absoluteString, tag: tag)
            }
            catch{print(error)}
       }
   }
    
   func readFromFile(fileName:String,tag:Int)->String{
      var result:String=""
    return result
    }
}

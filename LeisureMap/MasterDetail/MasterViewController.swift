//
//  MasterViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class MasterViewController: UIViewController,FileWorkerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category=categories[indexPath.row]
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCellView", for: indexPath) as! ServiceCellView
        cell.updateContent(service: category)
        return cell
    }
    
    
    var categories:[ServiceCategory]=[]
    var stores:[Store]=[]
    var displayStores:[Store]=[]
    var selectStore:Store?
    
    var fileWorker:FileWorker?
    let storeFileName="store.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let sqliteContext = SQLiteWorker()
        categories=sqliteContext.readData()
        
        
        fileWorker=FileWorker()
        fileWorker?.fileWorkerDelegate = self
        
        let content=self.fileWorker?.readFromFile(fileName: storeFileName, tag: 1)
                    do{
                        if let dataFromString = content?.data(using: .utf8, allowLossyConversion: false) {
                            let json = try JSON(data: dataFromString)
                            for(_,subJson):(String,JSON) in json{
                                
                                let store: Store=Store()
                                
                                // {"serviceIndex":0,"name":"Cafe00","location":{"address":"","latitude":0.0,"longitude":0.0},"index":0,"imagePath":""}
                                let serviceIndex : Int = subJson["serviceIndex"].intValue
                                let name : String = subJson["name"].stringValue
                                let index : Int = subJson["index"].intValue
                                let imagePath: String = subJson["imagePath"].stringValue
        
                                let location : JSON = subJson["location"]
                                let address : String = location["address"].stringValue
                                let latitude : Double = location["latitude"].doubleValue
                                let longitude : Double = location["longitude"].doubleValue
                                
                                
                                store.ServiceIndex=serviceIndex
                                store.Name=name
                                store.Index=index
                                store.ImagePath=imagePath
                                
                                
                                store.StoreLocation=LocatoionDesc()
                                store.StoreLocation?.Address=address
                                store.StoreLocation?.Latitude=latitude
                                store.StoreLocation?.Longitude=longitude
                                
                                
                                
                                stores.append(store)
        
        
                                print("\(index):\(name):\( latitude )")
                            }
                        }
                    }catch{
                        print(error)
                    }
              displayStores=displayStores+stores
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK-FileWorkerDelegate
    func fileWorkerWriteCompleted(_ sender: FileWorker, fileName: String, tag: Int) {
        //print(fileName)
    }
    
    func fileWorkerReadCompleted(_ sender: FileWorker, content: String, tag: Int) {
          //print(content)
    }
    
}

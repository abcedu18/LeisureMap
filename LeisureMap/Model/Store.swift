//
//  Store.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/27.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import Foundation
class Store{
    
    var ServiceIndex:Int = 0;
    var Name:String?
    var StoreLocation:LocatoionDesc?
    var Index : Int=0
    var ImagePath : String?
}


class LocatoionDesc{
    var Address : String?
    var Latitude : Double?
    var Longitude : Double?
    
}

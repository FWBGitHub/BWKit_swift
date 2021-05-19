//
//  NSObject+BWExtension.swift
//  BWKit_swift
//
//  Created by fwb on 2021/5/19.
//

import UIKit

public extension BWSpace where Base:NSObject{
    ///获取classname
    var className:String{
        get{
            let name =  type(of: self.base).description()
            if(name.contains(".")){
                return name.components(separatedBy: ".")[1];
            }else{
                return name;
            }
            
        }
    }

}

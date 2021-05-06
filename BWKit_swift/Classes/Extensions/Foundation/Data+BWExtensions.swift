//
//  NSData+BWExtension.swift
//  BWKit_swift
//
//  Created by fwb on 2021/5/6.
//

import UIKit

public extension BWSpace where Base == Data{
    func dict() -> Dictionary<String, Any>{
        do{
            let json = try JSONSerialization.jsonObject(with: self.base, options: .mutableContainers)
            let dic = json as! Dictionary<String, Any>
            return dic
        }catch _ {
               BWPrint("data->dict失败")
               return Dictionary()
        }
    }
}

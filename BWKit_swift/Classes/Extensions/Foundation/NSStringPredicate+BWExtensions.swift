//
//  NSStringPredicate+Extension.swift
//  QianCheng
//
//  Created by macbook on 17/3/22.
//  Copyright © 2017年 fwb. All rights reserved.
//

import UIKit

public extension BWSpace where Base == String{
    enum StringValidateType {
        case email
        case phoneNumber
        case carNumber
        case URL
        case IP
        case password
    }
 
    func validate(type:StringValidateType) -> Bool{
        var predicateStr:String!
        switch type {
        case .email:
            predicateStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        case .phoneNumber:
            predicateStr = "^((14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
            
        case .carNumber:
            predicateStr = "^[A-Za-z]{1}[A-Za-z_0-9]{5}$"
        case .URL:
            predicateStr = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
        case .IP:
            predicateStr = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        case .password:
            predicateStr = "^[a-zA-Z0-9]{6,20}+$"
        }
        
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: self.base)
    }
}

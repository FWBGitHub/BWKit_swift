//
//  UIFontExtension.swift
//  PceggsAPP
//
//  Created by fwb on 2020/7/10.
//  Copyright © 2020 YT. All rights reserved.
//

import UIKit
public func bw_scaleFloat(_ x:CGFloat)->CGFloat{
    return (x)/(375.0/min(BWConst.Screen_Width, BWConst.Screen_Height))
}
public func bw_scaleTextFloat(_ x:CGFloat)->CGFloat{
    if(BWConst.Screen_Width == 320.0){
        return x-1;
    }else if(BWConst.Screen_Width == 375.0){
        return x;
    }else{
        return x+1;
    }
}
public extension BWSpace where Base:UIFont{
    static func font(_ x:CGFloat ,weight:UIFont.Weight) -> UIFont{
        return UIFont.systemFont(ofSize: bw_scaleTextFloat(x), weight: weight)
    }
    static func fontName(_ fontName:String , x:CGFloat) -> UIFont{
        return UIFont(name: fontName, size: bw_scaleTextFloat(x))!
    }
    static func font_regular(_ x:CGFloat) -> UIFont{
        return font(x, weight: .regular)
    }
    static func font_DINMedium(_ x:CGFloat) -> UIFont{
        return fontName("DIN-Medium", x: x)
    }
}








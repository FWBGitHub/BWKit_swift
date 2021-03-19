//
//  UIColorExtension.swift
//  QianCheng
//
//  Created by macbook on 17/3/16.
//  Copyright © 2017年 fwb. All rights reserved.
//

import UIKit

public extension UIColor{
    ///十六进制，example:0xffffff
    convenience init(_ hexColor: UInt) {
        self.init(hexColor, alpha: 1.0)
    }
    ///十六进制，alpha ，example:0xffffff
    convenience init(_ hexColor: UInt , alpha: CGFloat) {
        self.init(
            red: CGFloat((hexColor & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexColor & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexColor & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    ///RGB
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(r: r, g: g, b: b, alpha: 1.0)
    }
    ///RGB
    convenience init(r: CGFloat, g:CGFloat, b: CGFloat ,alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }

  
}
public extension BWSpace where Base:UIColor{
    ///随机色
    static func RANDOM_COLOR() -> UIColor {
        let colorValue1 :CGFloat!  = CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX))
        let colorValue2 :CGFloat!  = CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX))
        let colorValue3 :CGFloat!  = CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX))
        return UIColor(red: colorValue1, green: colorValue2, blue: colorValue3, alpha: 1.0)
    }
}


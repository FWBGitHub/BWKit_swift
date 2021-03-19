//
//  UIImageExtension.swift
//  Qc 4.0.0
//
//  Created by 方文炳 on 2017/5/19.
//  Copyright © 2017年 Aheading. All rights reserved.
//

import UIKit

public extension BWSpace where Base:UIImage{
    ///调整图片大小
    func scaleToSize(size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.base.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    ///修改图片颜色
    func changeColor(color:UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.base.size, false, self.base.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.base.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(.normal)
        let rect = CGRect(x: 0, y: 0, width: self.base.size.width, height: self.base.size.height)
        context?.clip(to: rect, mask: self.base.cgImage!);
        color.setFill()
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
  
}

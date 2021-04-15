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
public extension NSObject{
    ///获取当前bundle图片
    func imageName(_ name:String) -> UIImage{
        let currentBundle = Bundle(for: self.classForCoder)
        let dict = currentBundle.infoDictionary
        let bundleName = dict?["CFBundleName"]
        let scale:Int = Int(UIScreen.main.scale)
        let imageName = "\(name)@\(scale)x"
        let bundleNamePath = "\(bundleName ?? "").bundle"
        let bundlePath = currentBundle.resourcePath?.appending("/\(bundleNamePath)") ?? ""
        let resource_bundle = Bundle(path: bundlePath)
        return UIImage(named: imageName, in: resource_bundle, compatibleWith: nil) ?? UIImage()
    }
    ///获取指定bundle图片
    func imageName(_ name:String,_ bundle:String) -> UIImage{
        let currentBundle = Bundle(for: self.classForCoder)
        let scale:Int = Int(UIScreen.main.scale)
        let imageName = "\(name)@\(scale)x"
        let bundleNamePath = "\(bundle).bundle"
        let bundlePath = currentBundle.resourcePath?.appending("/\(bundleNamePath)") ?? ""
        let resource_bundle = Bundle(path: bundlePath)
        return UIImage(named: imageName, in: resource_bundle, compatibleWith: nil) ?? UIImage()
    }
    ///获取指定bundle图片,不区分2x,3x
    func imageNameNormal(_ name:String,_ bundle:String) -> UIImage{
        let currentBundle = Bundle(for: self.classForCoder)
        let imageName = "\(name)"
        let bundleNamePath = "\(bundle).bundle"
        let bundlePath = currentBundle.resourcePath?.appending("/\(bundleNamePath)") ?? ""
        let resource_bundle = Bundle(path: bundlePath)
        return UIImage(named: imageName, in: resource_bundle, compatibleWith: nil) ?? UIImage()
    }
}

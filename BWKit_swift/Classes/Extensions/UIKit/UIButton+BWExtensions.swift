//
//  UIButtonExtension.swift
//  QianChengApp
//
//  Created by macbook on 17/3/6.
//  Copyright © 2017年 fwb. All rights reserved.
//

import UIKit

public extension BWSpace where Base:UIButton{
    static func createButton(textFont:UIFont,textColor:UIColor) -> UIButton{
        let btn = UIButton()
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = textFont
        return btn
    }
    static func createButton(image:UIImage,target:Any?,action:Selector?) -> UIButton{
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        btn.addTarget(target, action: action!, for: .touchUpInside)
        return btn
    }
    static func createButton(backImage:UIImage,target:Any?,action:Selector?) -> UIButton{
        let btn = UIButton()
        btn.setBackgroundImage(backImage, for: .normal)
        btn.addTarget(target, action: action!, for: .touchUpInside)
        return btn
    }

}


//
//  UILabel+Extension.swift
//  QianChengApp
//
//  Created by macbook on 17/3/3.
//  Copyright © 2017年 fwb. All rights reserved.
//

import UIKit

public extension BWSpace where Base:UILabel{
    static func createLabel(textFont:UIFont,textColor:UIColor) -> UILabel{
        let label = UILabel()
        label.font = textFont
        label.textColor = textColor
        return label
    }
}

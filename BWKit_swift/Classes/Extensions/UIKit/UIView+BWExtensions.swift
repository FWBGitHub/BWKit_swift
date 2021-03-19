//
//  UIViewExtension.swift
//  QianChengApp
//
//  Created by macbook on 17/3/7.
//  Copyright © 2017年 fwb. All rights reserved.
//

import UIKit

public extension BWSpace where Base:UIView{
    var x: CGFloat{
        get{
            return self.base.frame.origin.x
        }
        set{
            var r = self.base.frame
            r.origin.x = newValue
            self.base.frame = r
        }
    }
    var y: CGFloat{
        get{
            return self.base.frame.origin.y
        }
        set{
            var r = self.base.frame
            r.origin.y = newValue
            self.base.frame = r
        }
    }
    var width:CGFloat{
        get{
            return self.base.frame.size.width
        }
        set{
            var r = self.base.frame
            r.size.width = newValue
            self.base.frame = r
        }
    }
    var height:CGFloat{
        get{
            return self.base.frame.size.height
        }
        set{
            var r = self.base.frame
            r.size.height = newValue
            self.base.frame = r
        }
    }
    // left
    var left : CGFloat {
        get {
            return x
        }
        
        set(newVal) {
            x = newVal
        }
    }
    
    // right
    var right : CGFloat {
        get {
            return x + width
        }
        set(newVal) {
            x = newVal - width
        }
    }
    
    // top
    var top : CGFloat {
        get {
            return y
        }
        set(newVal) {
            y = newVal
        }
    }
    
    // bottom
    var bottom : CGFloat {
        get {
            return y + height
        }
        set(newVal) {
            y = newVal - height
        }
    }
    
    var centerX : CGFloat {
        get {
            return self.base.center.x
        }
        set(newVal) {
            self.base.center = CGPoint(x: newVal, y: self.base.center.y)
        }
    }
    
    var centerY : CGFloat {
        get {
            return self.base.center.y
        }
        set(newVal) {
            self.base.center = CGPoint(x: self.base.center.x, y: newVal)
        }
    }
    
    var middleX : CGFloat {
        get {
            return width / 2
        }
    }
    
    var middleY : CGFloat {
        get {
            return height / 2
        }
    }
    
    var middlePoint : CGPoint {
        get {
            return CGPoint(x: middleX, y: middleY)
        }
    }
}
public extension BWSpace where Base:UIView{
    ///添加点击事件
    func addTarget(target:Any? , action:Selector?){
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.base.addGestureRecognizer(tap)
    }
    ///圆角
    func clipCornerRadius(_ cornerRadius:CGFloat){
        self.base.layer.cornerRadius = cornerRadius
        self.base.clipsToBounds = true
    }
    ///自动布局优先级设置
    func autoLayoutContentPriority(_ axis:NSLayoutConstraint.Axis){
        self.base.setContentHuggingPriority(.required, for: axis)
        self.base.setContentCompressionResistancePriority(.required, for: axis)
    }
    ///添加渐变色图层
    func addGradientLayerColors(_ colors:Array<Any>,startPoint:CGPoint,endPoint:CGPoint){
        self.base.superview?.layoutIfNeeded()
        let gradient = CAGradientLayer()
        gradient.frame = self.base.bounds
        gradient.colors = colors
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        self.base.layer.insertSublayer(gradient, at: 0)
    }
}

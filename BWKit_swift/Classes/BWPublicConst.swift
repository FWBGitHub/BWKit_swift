//
//  GlobalConst.swift
//  Swift_Projects
//
//  Created by macbook on 16/11/2.
//  Copyright © 2016年 mengxia. All rights reserved.
//

import UIKit
public struct BWConst{
    public static let Screen_Width:CGFloat = UIScreen.main.bounds.width
    public static let Screen_Height:CGFloat = UIScreen.main.bounds.height
    
    ///获得沙盒的根路径
    public static let Home_Path = NSHomeDirectory()
    ///获得沙盒的Documents路径
    public static let Documents_Path = Home_Path+"/Documents"
    ///获得沙盒的Library路径
    public static let Library_Path = Home_Path+"/Library"
    ///获得当前window
    public static let window:UIView = (UIApplication.shared.delegate?.window)!!
    ///状态栏高度
    public static let statusBarHeight:CGFloat = (UIDevice.bw.isIPhoneX_After() ? 44.0 : 20.0)
    ///导航栏高度
    public static let navHeight:CGFloat = 44.0
    ///整个头部高度
    public static var statusNavHeight:CGFloat {statusBarHeight + navHeight}
    ///底部Tabbar高度
    public static let bottomBarHeight:CGFloat = (UIDevice.bw.isIPhoneX_After() ? 83.0 : 49.0)
}
public extension BWSpace where Base == BWConst{
}

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
   
    ///状态栏高度
    public static let statusBarHeight:CGFloat = {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?
                           .statusBarManager?.statusBarFrame.height ?? 0
        }else{
            return UIApplication.shared.statusBarFrame.size.height
        }
    }()
    ///导航栏高度
    public static let navHeight:CGFloat = 44.0
    ///整个头部高度
    public static var statusNavHeight:CGFloat {statusBarHeight + navHeight}
    ///底部Tabbar高度
    public static let bottomBarHeight:CGFloat = (UIDevice.bw.isIPhoneX_After() ? 83.0 : 49.0)
    ///获得当前window
    public static let window:UIWindow? = {
        var temp:UIWindow?
        if #available(iOS 13, *) {
            if #available(iOS 15, *) {
                temp = UIApplication.shared.connectedScenes
                            .map({ $0 as? UIWindowScene })
                            .compactMap({ $0 })
                            .first?.windows.first
            }else{
                temp = UIApplication.shared.windows.first
            }
        }else{
            temp = UIApplication.shared.keyWindow
        }
        return temp
    }()
}
public extension BWSpace where Base == BWConst{
}

//
//  DeviceType.swift
//  Qc 4.0.0
//
//  Created by 方文炳 on 2017/5/18.
//  Copyright © 2017年 Aheading. All rights reserved.
//

import UIKit
enum BWDeviceType:Int {
    case BW_UNKNOWN = 0
    case BW_iPhone4             //iPhone4、iPhone4S
    case BW_iPhone5             //iPhone5、iPhone5C和iPhone5S
    case BW_iPhone6             //iPhone6、iPhone6S、iPhone7
    case BW_iPhone6_Plus        //iPhone6 Plus、iPhone6S Plus、iPhone7 Plus
    case BW_iPad                //iPad1、iPad2
    case BW_iPad_Mini           //iPad mini1
    case BW_Ipad_Retina         //New iPad、iPad4和iPad Air
    case BW_iPad_Mini_Retine    //iPad mini2
}

extension UIDevice{
    static var deviceType:BWDeviceType{
        guard let size = UIScreen.main.currentMode?.size else{
            return .BW_UNKNOWN
        }
        switch size {
        case CGSize(width: 640 , height: 690 ):return.BW_iPhone4
        case CGSize(width: 640 , height: 1136):return.BW_iPhone5
        case CGSize(width: 750 , height: 1334):return.BW_iPhone6
        case CGSize(width: 1242, height: 2208):return.BW_iPhone6_Plus
        case CGSize(width: 1024, height: 768 ):return.BW_iPad
        case CGSize(width: 768 , height: 1024):return.BW_iPad_Mini
        case CGSize(width: 2048, height: 1536):return.BW_Ipad_Retina
        case CGSize(width: 1536, height: 2048):return.BW_iPad_Mini_Retine
        default: return.BW_UNKNOWN
        }
    }
}
public extension BWSpace where Base:UIDevice{

    static func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    static func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    static func isIPhone4S() -> Bool {
        return UIDevice.deviceType == .BW_iPhone4
    }
    static func isIPhone5() -> Bool {
        return UIDevice.deviceType == .BW_iPhone5
    }
    static func isIPhone6() -> Bool {
        return UIDevice.deviceType == .BW_iPhone6
    }
    static func isIPhone6Plus() -> Bool {
        return UIDevice.deviceType == .BW_iPhone6_Plus
    }
    static func isIPhoneX_After() -> Bool{
        if #available(iOS 11.0, *) {
            return (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)! > 0.0
        }
        return false;
    }
}

//extension UIDevice {
//     ///判断当前设备的系统版本是否大于或者等于#version
//   static func isCompareVersion(_ version: String) -> Bool {
//        return compare(version: version) != .orderedAscending
//    }
//
//    private func compare(version: String) -> ComparisonResult {
//        return UIDevice.current.systemVersion.compare(version)
//    }
//}
public extension BWSpace where Base:UIDevice{
    ///获取app版本
    static var appVersion:String{
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    ///获取appName
    static var appName:String{
        return Bundle.main.infoDictionary?["CFBundleName"] as! String
    }
    ///获取app版本传给后台
    static var appVersionNumber:String{
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        return version.replacingOccurrences(of: ".", with: "")
    }
    ///获取手机型号
    static var phoneModel:String{
        var systemInfo = utsname()
        uname(&systemInfo)
        return withUnsafeMutablePointer(to: &systemInfo.machine.0) { ptr in
            return String(cString: ptr)
        }
    }
    ///获取系统版本
    static var systemVersionStr:String{
        return UIDevice.current.systemVersion
    }
}

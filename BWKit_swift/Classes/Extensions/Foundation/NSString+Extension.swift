//
//  NSString+Extension.swift
//  QianChengApp
//
//  Created by macbook on 17/3/6.
//  Copyright © 2017年 fwb. All rights reserved.
//

import UIKit
import CommonCrypto
public extension String{
    /// String使用下标截取字符串 , 示例字符串"[0..<2] 结果是 "示例"
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return String(self[startIndex..<endIndex])
        }
    }
}
public extension BWSpace where Base == String{
    /*计算文本宽、高*/
    func calculateWithFont(textFont:AnyObject,maxWidth:CGFloat) -> CGSize{
        var attributes:[NSAttributedString.Key:AnyObject]
        if textFont.isKind(of: UIFont.self){
            let font:UIFont = textFont as! UIFont
            
            
            attributes = [NSAttributedString.Key.font:font]
        }else{
            attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: textFont as! CGFloat)]
        }
        
        let rect = (self.base as NSString).boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.size
    }
    func calculateWithFont(textFont:AnyObject) -> CGSize{
        var attributes:[NSAttributedString.Key:AnyObject]
        if textFont.isKind(of: UIFont.self){
            let font:UIFont = textFont as! UIFont
            attributes = [NSAttributedString.Key.font:font]
        }else{
            attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: textFont as! CGFloat)]
        }
        let rect = (self.base as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.size
    }
    ///Range-->NSRange
    func nsRange(from Range: Range<String.Index>) -> NSRange {
        return NSRange(Range, in: self.base)
    }
    func nsrangeToStr(of string: String) -> NSRange {
        let range = self.base.range(of: string)
        return nsRange(from: range!)
    }
    ///获取当前时间戳
    static func getCurrentDate()->String{
        let time = Int(Date().timeIntervalSince1970)
        return "\(time)"
    }
    var isBlank : Bool{
        return self.base.allSatisfy({$0.isWhitespace})
    }
    func dict() -> Dictionary<String,Any>{
        guard !self.isBlank else{
            return [:]
        }
        let data = self.base.data(using: .utf8)
        guard (data != nil) else {
            return [:]
        }
        
        let dict = try? JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableContainers)
        guard dict != nil else {
            return [:]
        }
        return dict as! Dictionary<String, Any>
    }
    func vc() -> UIViewController?{
        guard let nameSpage = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return nil
        }
        guard let childVcClass = NSClassFromString(nameSpage + "." + self.base) else {
            return nil
        }
        guard let childVcType = childVcClass as? UIViewController.Type else {
            return nil;
        }
        return childVcType.init();
    }

}

//MARK: MD5加密
public extension BWSpace where Base == String{
    /// MD5加密类型
    enum MD5EncryptType {
        /// 32位小写
        case lowercase32
        /// 32位大写
        case uppercase32
        /// 16位小写
        case lowercase16
        /// 16位大写
        case uppercase16
    }
    func MD5Encrypt(_ md5Type: MD5EncryptType = .lowercase32) -> String {
        guard self.base.count > 0 else {
            print("⚠️⚠️⚠️md5加密无效的字符串⚠️⚠️⚠️")
            return ""
        }
        /// 1.把待加密的字符串转成char类型数据 因为MD5加密是C语言加密
        let cCharArray = self.base.cString(using: .utf8)
        /// 2.创建一个字符串数组接受MD5的值
        var uint8Array = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        /// 3.计算MD5的值
        /*
         第一个参数:要加密的字符串
         第二个参数: 获取要加密字符串的长度
         第三个参数: 接收结果的数组
         */
        CC_MD5(cCharArray, CC_LONG(cCharArray!.count - 1), &uint8Array)
        
        switch md5Type {
        /// 32位小写
        case .lowercase32:
            return uint8Array.reduce("") { $0 + String(format: "%02x", $1)}
        /// 32位大写
        case .uppercase32:
            return uint8Array.reduce("") { $0 + String(format: "%02X", $1)}
        /// 16位小写
        case .lowercase16:
            let tempStr = uint8Array.reduce("") { $0 + String(format: "%02x", $1)}
            return tempStr[8..<24]
        /// 16位大写
        case .uppercase16:
            let tempStr = uint8Array.reduce("") { $0 + String(format: "%02X", $1)}
            return tempStr[8..<24]
        }
    }
}

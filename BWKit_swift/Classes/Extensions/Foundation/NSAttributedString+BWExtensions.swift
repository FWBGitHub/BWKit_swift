//
//  NSAttributedString+BWExtensions.swift
//  BWKit_swift
//
//  Created by fwb on 2021/3/30.
//

import UIKit

public extension NSAttributedString{
    ///图片-->富文本
    convenience init(_ image:UIImage , rect:CGRect) {
        let att = NSTextAttachment()
        att.image = image
        att.bounds = rect
        self.init(attachment: att)
    }


}
public extension BWSpace where Base == NSAttributedString{
    ///富文本计算size
    func computeSizeWithFont(_ font:UIFont) -> CGSize {
        //swift不支持枚举多选
//        let options : NSStringDrawingOptions = .UsesLineFragmentOrigin | .UsesFontLeading
        return self.base.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, context: nil).size
    }
}
public extension NSMutableAttributedString{
    ///html->att textColorHex：文本颜色，16进制 ，#000000
    convenience init(_ htmlText:String,textFont:UIFont,textColorHex:String){
        var html = htmlText
        if(textColorHex.count != 0){
            html = "<font color = '\(textColorHex)'>\(htmlText)</font>"
        }
        try! self.init(data: html.data(using: String.Encoding.utf16)!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        self.addAttributes([NSAttributedStringKey.font:textFont], range: NSRange(location: 0, length: self.length ))
    }

}
public extension BWSpace where Base == NSMutableAttributedString{
    func textColor(_ color:UIColor , rang:NSRange){
        self.base.addAttributes([NSAttributedStringKey.foregroundColor:color], range: rang)
    }
    func font(_ font:UIFont , rang:NSRange){
        self.base.addAttributes([NSAttributedStringKey.font:font], range: rang)
    }
    func lineSpacing(_ lineSpace:CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        self.base.addAttributes([NSAttributedStringKey.paragraphStyle:paragraphStyle], range:NSRange(location: 0, length: self.base.length))
    }
    func fontsHorizontal(_ minFontSize:CGFloat , maxFontSize:CGFloat ,range:NSRange){
        let fontRatio:CGFloat = 0.16
        let offset:CGFloat = fontRatio * (maxFontSize - minFontSize)
        self.base.addAttributes([NSAttributedStringKey.baselineOffset:(offset)], range: range)
    }
    ///富文本计算size
    func computeSizeWithFont(_ font:UIFont) -> CGSize {
        //swift不支持枚举多选
//        let options : NSStringDrawingOptions = .UsesLineFragmentOrigin | .UsesFontLeading
        return self.base.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, context: nil).size
    }
}

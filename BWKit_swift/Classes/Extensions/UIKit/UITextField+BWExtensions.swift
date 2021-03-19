//
//  UITextFieldExtension.swift
//  PCmjzyApp
//
//  Created by fwb on 2021/1/14.
//

import UIKit

extension UITextField {
    private struct AssociatedKey {
        static var limitNumber_identifier: String = "UITextField.limitNumber"
    }
    
    public var bw_limitNumber: NSInteger {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.limitNumber_identifier) as! NSInteger
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKey.limitNumber_identifier, newValue, .OBJC_ASSOCIATION_ASSIGN)
            self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    @objc func textFieldDidChange( _ textField:UITextField){
        if (textField.text!.count > textField.bw_limitNumber) {
            let str:String = textField.text!
            self.text = String(str[..<str.index(str.startIndex, offsetBy: textField.bw_limitNumber)])
        }
    }
}

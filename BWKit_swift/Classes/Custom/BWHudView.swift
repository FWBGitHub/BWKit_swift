//
//  HudView.swift
//  PCmjzyApp
//
//  Created by fwb on 2021/1/13.
//

import UIKit
public extension BWSpace where Base:NSObject{
    ///弹窗 msg
    func showHint(_ msg:String){
        if(self.base.isKind(of: UIView.self)){
            showHintView(msg, addView: self.base as! UIView)
            return
        }
        guard (UIApplication.shared.delegate?.window) != nil else {
            return
        }
        showHintView(msg, addView: UIApplication.shared.delegate?.window as! UIView)
    }
    ///弹窗 msg addView
    func showHint(_ msg:String , addView:UIView){
        showHintView(msg, addView: UIApplication.shared.delegate?.window as! UIView)
    }
    private func showHintView(_ msg:String , addView:UIView){
        guard !msg.isEmpty else {
            return
        }
        addView.bw_showHudView(msg)
    }
    
    
}
private extension UIView{
    private struct AssociatedKey {
        static var identifier: String = "HudView.lastHubView"
    }
    
    var lastHubView: UIView {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.identifier) as? UIView ?? UIView()
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKey.identifier, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func bw_showHudView(_ msg:String){
        guard msg.isEmpty else {
            if(self.lastHubView != nil){
                if(self.lastHubView.superview != nil){
                    self.perform(#selector(hideDelayed), with: self.lastHubView)
                    
                }
            }
            
            let view:UIView = self.isKind(of: UIResponder.classForCoder()) ? self: UIApplication.shared.delegate?.window as! UIView
            let contentView = UIView()
            
            contentView.backgroundColor = UIColor(0x000000, alpha: 0.5)
            view.addSubview(contentView)
            
            let label = UILabel()
            label.textColor = .white
            label.font = UIFont.bw.font_regular(14.0)
            label.text = msg
            label.numberOfLines = 0 ;
            label.textAlignment = .center
            contentView.addSubview(label)
            let leftMargin = bw_scaleFloat(23.0);
            let leftToViewMargin = bw_scaleFloat(10.0);
            
            let topMargin = bw_scaleFloat(9.0);
            
            let msgSize = msg.bw.calculateWithFont(textFont: label.font, maxWidth:(view.frame.size.width - leftMargin*2 - leftToViewMargin*2))
            
            contentView.frame = CGRect(x: 0, y: 0, width: msgSize.width+leftMargin*2, height: msgSize.height+topMargin*2)
            label.frame = CGRect(x: leftMargin, y: topMargin, width: msgSize.width, height: msgSize.height)
            
            contentView.center = CGPoint(x: view.center.x, y: (view.frame.size.height - view.frame.origin.y - contentView.frame.size.height)*0.5)
            contentView.layer.cornerRadius = bw_scaleFloat(6.0);
            contentView.clipsToBounds = true
            contentView.alpha = 0;
            UIView.animate(withDuration: 0.2) {
                contentView.alpha = 1;
            } completion: { (finish) in
                DispatchQueue.main.asyncAfter(deadline:  .now()+1.5) { [self] in
                    self.perform(#selector(hideDelayed), with: contentView)
                }
            }
            self.lastHubView = contentView;
            return
        }
    }
    @objc  func hideDelayed(with obj:Any){
        let contentView:UIView = obj as! UIView
        UIView.animate(withDuration: 0.2) {
            contentView.alpha = 0;
        } completion: { (finish) in
            contentView.removeFromSuperview()
        }
    }
}

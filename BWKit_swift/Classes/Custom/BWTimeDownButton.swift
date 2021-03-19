//
//  BWTimeDownButton.swift
//  PCmjzyApp
//
//  Created by fwb on 2021/1/14.
//

import UIKit
public let BWTimeDownTitle = "BWTimeDownTitle"
public class BWTimeDownButton: UIButton {
    public enum BWTimeDownType {
        ///可倒计时--可点击
        case BWTimeDownNormal
        ///准备倒计时--不可点击
        case BWTimeDownBefore
        ///倒计时中..--不可点击
        case BWTimeDowning
        ///倒计时结束--可点击
        case BWTimeDowned

    }
    private struct BWTimeDownStateKey {
        static var BWTimeDownBefore_title: String = "BWTimeDownBefore_title"
        static var BWTimeDownBefore_titleColor: String = "BWTimeDownBefore_titleColor"
        static var BWTimeDowning_title: String = "BWTimeDowning_title"
        static var BWTimeDowning_titleColor: String = "BWTimeDowning_titleColor"
        static var BWTimeDowned_title: String = "BWTimeDowned_title"
        static var BWTimeDowned_titleColor: String = "BWTimeDowned_titleColor"
    }
    private lazy var stateDict: Dictionary<String,Any> = {
        let dict = Dictionary<String, Any>()
        return dict
    }()
    ///倒计时时间
    public var timeDown:NSInteger = 0{
        didSet{
            
        }
    }
    ///倒计时时间颜色
    public var timeColor:UIColor?{
        didSet{
            
        }
    }
    ///倒计时title
    public var disableTitle:String = ""{
        didSet{
            
        }
    }
    public func bw_setTitle(_ title:String,timeDownstate:BWTimeDownType){
        switch timeDownstate {
        case .BWTimeDownNormal:
            self.setTitle(title, for:.normal)
            break
        case .BWTimeDownBefore:
            self.stateDict[BWTimeDownStateKey.BWTimeDownBefore_title] = title
            break
        case .BWTimeDowning:
            self.stateDict[BWTimeDownStateKey.BWTimeDowning_title] = title
            break
        case .BWTimeDowned:
            self.stateDict[BWTimeDownStateKey.BWTimeDowned_title] = title

            break


        }
        
    }
    public func bw_setTitleColor(_ color:UIColor,timeDownstate:BWTimeDownType){
        switch timeDownstate {
        case .BWTimeDownNormal:
            self.setTitleColor(color, for:.normal)
            break
        case .BWTimeDownBefore:
            self.stateDict[BWTimeDownStateKey.BWTimeDownBefore_titleColor] = color
            break
        case .BWTimeDowning:
            self.stateDict[BWTimeDownStateKey.BWTimeDowning_titleColor] = color
            break
        case .BWTimeDowned:
            self.stateDict[BWTimeDownStateKey.BWTimeDowned_titleColor] = color

            break


        }
    }
    var timer:DispatchSourceTimer?
    public func startTimeBefore(){
        self.setTitle(self.stateDict[BWTimeDownStateKey.BWTimeDownBefore_title] as? String, for: .disabled)
        self.setTitleColor(self.stateDict[BWTimeDownStateKey.BWTimeDownBefore_titleColor] as? UIColor, for: .disabled)
        self.isEnabled = false
    }
    public func startTimeDown(){
        let normalColor = self.titleColor(for: .normal)
        let normalTitle = self.title(for: .normal)
        let disableColor:UIColor = stateDict[BWTimeDownStateKey.BWTimeDowning_titleColor] as! UIColor
        let disableTitleTemp:String = stateDict[BWTimeDownStateKey.BWTimeDowning_title] as! String
        
        self.setTitleColor(disableColor, for: .disabled)
        self.setTitle(disableTitleTemp.replacingOccurrences(of: BWTimeDownTitle, with: "\(timeDown - 1)"), for: .disabled)
        self.isEnabled = false
        
        //开始倒计时
        var timeOut = timeDown - 1
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timer!.schedule(deadline: .now(), repeating: 1)
        timer!.setEventHandler { [self] in
            //倒计时结束，关闭
            if(timeOut <= 0){
                timer!.cancel()
                DispatchQueue.main.async { [self] in
                    if(stateDict.keys.contains(BWTimeDownStateKey.BWTimeDowned_title)){
                        self.setTitle(stateDict[BWTimeDownStateKey.BWTimeDowned_title] as? String , for: .normal)

                    }else{
                        self.setTitle(normalTitle, for: .normal)
                    }
                    if(stateDict.keys.contains(BWTimeDownStateKey.BWTimeDowned_titleColor)){
                        self.setTitleColor(stateDict[BWTimeDownStateKey.BWTimeDowned_titleColor] as? UIColor, for: .normal)

                    }else{
                        self.setTitleColor(normalColor, for: .normal)
                    }
                    self.isEnabled = true
                }
            }else{
                let seconds = timeOut % 61
                let timeStr = "\(seconds)s"
                DispatchQueue.main.async { [self] in
                    if(self.timeColor != nil){
                        self.setAttributedTitle(getDisableAttrbute(time: timeStr), for: .disabled)
                    }else{
                        self.setTitle(disableTitle.replacingOccurrences(of: BWTimeDownTitle, with: timeStr), for: .disabled)

                    }
                }
                timeOut -= 1
            }
        }
    }
    func getDisableAttrbute(time:String) -> NSMutableAttributedString{
        var disableTitle:String = self.stateDict[BWTimeDownStateKey.BWTimeDowning_title] as! String
        disableTitle = disableTitle.replacingOccurrences(of: BWTimeDownTitle, with: time)
        let disableAttrbute = NSMutableAttributedString(string: disableTitle)
        
        disableAttrbute.addAttribute(.foregroundColor, value: self.stateDict[BWTimeDownStateKey.BWTimeDowning_titleColor] ?? "", range:NSRange(location: 0, length: disableAttrbute.length))
        
        disableAttrbute.addAttribute(.foregroundColor, value: self.timeColor as Any, range: disableAttrbute.string.bw.nsrangeToStr(of: time))
        return disableAttrbute
    }
    public func stopTimeDown(){
        if(self.timer == nil){
            return
        }else{
            self.isEnabled = true
            timer!.cancel()
        }
        
    }

}

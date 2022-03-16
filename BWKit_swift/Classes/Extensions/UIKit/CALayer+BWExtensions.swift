//
//  CALayer+BWExtensions.swift
//  BWKit_swift
//
//  Created by fwb on 2022/3/16.
//

import UIKit

public extension BWSpace where Base:CALayer{
    var x:CGFloat{
        get{
            return self.base.frame.origin.x
        }
    }
    var y:CGFloat{
        get{
            return self.base.frame.origin.y
        }
    }
    var width:CGFloat{
        get{
            return self.base.frame.size.width
        }
    }
    var height:CGFloat{
        get{
            return self.base.frame.size.height
        }
    }
    var max_x:CGFloat{
        get{
            return x+width
        }
    }
    var max_y:CGFloat{
        get{
            return y+height
        }
    }
}

public extension BWSpace where Base:CATextLayer{
    func textFont(_ font:UIFont){
        guard let cgfont = CGFont.init(font.fontName as CFString) else{
            return
        }
        self.base.font = cgfont
        self.base.fontSize = font.pointSize
        self.base.contentsScale = UIScreen.main.scale
    }
}

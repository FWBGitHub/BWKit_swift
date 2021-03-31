//
//  ViewController.swift
//  BWKit_swift
//
//  Created by FWBGitHub on 03/19/2021.
//  Copyright (c) 2021 FWBGitHub. All rights reserved.
//

import UIKit
import BWKit_swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "我的<font color = '#B8DF57'>sb</font>"
        let att = NSMutableAttributedString(str, textFont: UIFont.bw.font(22, weight: .bold), textColorHex: "#82abee")
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.attributedText = att
        view.addSubview(label)
        let temp = NSAttributedString(imageName(""), rect: .zero)
         let size = att.bw.computeSizeWithFont(UIFont.bw.font_regular(12))
        print("size=\(size)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


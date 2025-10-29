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
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(imageView)

        print("class=\(imageView.bw.currentVc())")
        let test_layer = CATextLayer()
        test_layer.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        test_layer.bw.textFont(UIFont.systemFont(ofSize: 30.0))
        test_layer.string = "123"
        test_layer.foregroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(test_layer)
        print("layer=\(test_layer.bw.x),\(test_layer.bw.max_x)")
        print("state.heght=\(BWConst.statusBarHeight)")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        BWConst.window?.bw.showHint("12312")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


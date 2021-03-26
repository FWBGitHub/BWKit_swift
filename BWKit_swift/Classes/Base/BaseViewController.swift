//
//  BaseViewController.swift
//  PCmjzyApp
//
//  Created by fwb on 2021/1/8.
//

import UIKit

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = .white;

    }

}

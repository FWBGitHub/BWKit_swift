//
//  BaseNavigationViewController.swift
//  PCmjzyApp
//
//  Created by fwb on 2021/1/12.
//

import UIKit
open class BaseNavigationViewController: UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        setNav()
    }
    
    func setNav() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationBar.isTranslucent = false
    }
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if(self.viewControllers.count > 0){
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    open override func popViewController(animated: Bool) -> UIViewController? {
        return super.popViewController(animated: animated)
    }
}

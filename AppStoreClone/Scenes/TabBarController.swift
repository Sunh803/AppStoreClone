//
//  TabBarController.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/03.
//

import Foundation
import UIKit
class TabBarController : UITabBarController{
    private lazy var todayViewController : UIViewController = {
        let viewcontroller = TodayViewController()
        let tabitem = UITabBarItem(title: "Today", image: UIImage(systemName: "mail"), tag:  0)
        viewcontroller.tabBarItem = tabitem
        return viewcontroller
    }()
    private lazy var appViewController : UIViewController = {
        let viewcontroller = UINavigationController(rootViewController: AppViewController())
        let tabitem = UITabBarItem(title: "APP", image: UIImage(systemName: "square.stack.3d.up"), tag: 1)
        viewcontroller.tabBarItem = tabitem
        return viewcontroller
    }()
    override func viewDidLoad(){
        super.viewDidLoad()
        viewControllers = [todayViewController, appViewController]
    }
}

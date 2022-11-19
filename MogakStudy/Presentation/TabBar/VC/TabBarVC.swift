//
//  TabBarVC.swift
//  MogakStudy
//
//  Created by Doy Kim on 2022/11/16.
//

import UIKit
import MogakStudyUIFramework

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTabBarController()
    }
    func setUI() {
        tabBar.tintColor = .msColor.brandGreen
        tabBar.unselectedItemTintColor = .msColor.gray006
        tabBar.backgroundColor = .msColor.white
    }
    
    func setTabBarController() {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: I18NStrings.TabBar.homeTab,
                                         image: UIImage(named: "tab_home_act"),
                                        selectedImage: UIImage(named: "tab_home_inact"))
        
        let shopVC = UIViewController()
        let shopNav = UINavigationController(rootViewController: shopVC)
        
        shopNav.tabBarItem = UITabBarItem(title: I18NStrings.TabBar.shopTab,
                                            image: UIImage(named: "tab_shop_act"),
                                            selectedImage: UIImage(named: "tab_shop_inact"))
        
        let friendVC = UIViewController()
        let friendNav = UINavigationController(rootViewController: friendVC)
        
        friendNav.tabBarItem = UITabBarItem(title: I18NStrings.TabBar.friendTab,
                                            image: UIImage(named: "tab_friend_act"),
                                            selectedImage: UIImage(named: "tab_friend_inact"))
        
        let mypageVC = MypageVC()
        let mypageNav = UINavigationController(rootViewController: mypageVC)
        
        mypageNav.tabBarItem = UITabBarItem(title: I18NStrings.TabBar.mypageTab,
                                            image: UIImage(named: "tab_mypage_inact"),
                                            selectedImage: UIImage(named: "tab_mypage_act"))
        
        setViewControllers([homeVC, shopNav, friendNav, mypageNav], animated: true)
    }
    
    
}

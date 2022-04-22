//
//  WUITabbarViewController.swift
//  wbea
//
//  Created by Hyubyn on 22/04/2022.
//

import UIKit

class WUITabbarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = WUITheme.WUIColor.lightBlue
        delegate = self
        setupControllers()
    }

    func setupControllers() {
        let homeNav = UINavigationController(rootViewController: TestFormViewController())
        homeNav.tabBarItem.title = "Search".localized
        homeNav.tabBarItem.image = UIImage(named: "ic-home")
        homeNav.tabBarItem.selectedImage = UIImage(named: "ic-home-selected")
        let searchNav = UINavigationController(rootViewController: TestFormViewController())
        searchNav.tabBarItem.title = "Home".localized
        searchNav.tabBarItem.image = UIImage(named: "ic-search")
        searchNav.tabBarItem.selectedImage = UIImage(named: "ic-search-selected")
        let mapVC = TestFormViewController()
        let mapNav = UINavigationController(rootViewController: mapVC)
        mapNav.tabBarItem.title = "Map".localized
        mapNav.tabBarItem.image = UIImage(named: "ic-map")
        mapNav.tabBarItem.selectedImage = UIImage(named: "ic-map-selected")
        let settingVC = TestFormViewController()
        let settingNav = UINavigationController(rootViewController: settingVC)
        settingNav.tabBarItem.title = "Settings".localized
        settingNav.tabBarItem.image = UIImage(named: "ic-settings")
        settingNav.tabBarItem.selectedImage = UIImage(named: "ic-settings-selected")
        viewControllers = [homeNav, searchNav, mapNav, settingNav]
        selectedIndex = 0

    }

    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

    }
}


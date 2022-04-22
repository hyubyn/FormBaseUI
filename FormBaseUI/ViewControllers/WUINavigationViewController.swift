//
//  WUINavigationViewController.swift
//  wbea
//
//  Created by Hyubyn on 22/04/2022.
//

import UIKit

class WUINavigationViewController: UINavigationController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.backItem?.title = ""
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        view.backgroundColor = HUIColor.white
        navigationBar.isTranslucent = false
        navigationBar.backItem?.title = ""
    }

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        view.backgroundColor = HUIColor.white
        navigationBar.isTranslucent = false
        navigationBar.backItem?.title = ""
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        view.backgroundColor = HUIColor.white
        navigationBar.isTranslucent = false
        navigationBar.backItem?.title = ""
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewControllers.first?.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        if viewControllers.count == 2 {
            viewControllers.first?.hidesBottomBarWhenPushed = false
        }
        return super.popViewController(animated: animated)
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        viewControllers.first?.hidesBottomBarWhenPushed = false
        return super.popToRootViewController(animated: animated)
    }

    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if viewController === viewControllers.first {
            viewControllers.first?.hidesBottomBarWhenPushed = false
        }
        return super.popToViewController(viewController, animated: animated)
    }

}

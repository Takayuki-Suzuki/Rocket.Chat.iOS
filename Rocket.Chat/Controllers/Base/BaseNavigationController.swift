//
//  BaseNavigationController.swift
//  Rocket.Chat
//
//  Created by Rafael K. Streit on 7/6/16.
//  Copyright © 2016 Rocket.Chat. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(navigationBarClass: BaseNavigationBar.self, toolbarClass: nil)
        self.setViewControllers([rootViewController], animated: false)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = self.navigationBar
        navBar.isTranslucent = false
        (navBar as? BaseNavigationBar)?.themeSource = self

        view.backgroundColor = .white
        ThemeManager.addObserver(self)
    }
}

extension BaseNavigationController: BaseNavigationBarThemeSource {
    var navigationBarTheme: Theme? {
        return topViewController?.view.theme
    }
}

// MARK: Themeable

extension BaseNavigationController {
    override func applyTheme() {
        super.applyTheme()
        view.backgroundColor = navigationBar.theme?.backgroundColor ?? .white
    }
}

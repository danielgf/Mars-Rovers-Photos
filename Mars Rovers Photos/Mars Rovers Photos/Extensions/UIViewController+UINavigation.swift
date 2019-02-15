//
//  ViewController+UINavigation.swift
//  A Lodjinha
//
//  Created by Daniel Griso Filho on 1/11/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit


extension UIAlertController {
    
    static func showSimpleAlert(_ title: String? = "", message: String, handle: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstButton = UIAlertAction(title: "ok".localized(), style: .default, handler: handle)
        alertController.addAction(firstButton)
        return alertController
    }
}

//
//  Extensions.swift
//  MalayaliDinoGame
//
//  Created by macbook on 16/01/2026.
//

import UIKit
import Foundation

extension UINavigationController {
    func backToViewController(viewController: Swift.AnyClass) {
            for element in viewControllers as Array {
                if element.isKind(of: viewController) {
                    self.popToViewController(element, animated: true)
                break
            }
        }
    }
}

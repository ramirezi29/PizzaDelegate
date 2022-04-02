//
//  Extensions.swift
//  DevMnt Pro Del
//
//  Created by Ivan Ramirez on 4/1/22.
//

import UIKit

extension UIView {
    
    func shake() {

        let translateRight = CGAffineTransform(translationX: 4.0, y: 0)
        let translateLeft = CGAffineTransform(translationX: -4.0, y: 0)

        self.transform = translateRight

        UIView.animate(withDuration: 0.07, delay: 0.01, options: [.autoreverse, .repeat]) {

            UIView.modifyAnimations(withRepeatCount: 2, autoreverses: true) {
                self.transform = translateLeft
            }
        } completion: { _ in
            self.transform = CGAffineTransform.identity
        }
    }
}

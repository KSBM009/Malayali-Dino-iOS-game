//
//  CustomNavBar.swift
//  MalayaliDinoGame
//
//  Created by macbook on 12/01/2026.
//

import UIKit

class CustomNavBar: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var backBtnV: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
}

extension UIView {
    func loadFromNib() -> UIView {
       let bundle = Bundle(for: type(of: self))
       let nibName = type(of: self).description().components(separatedBy: ".").last!
       let nib = UINib(nibName: nibName, bundle: bundle)
       return nib.instantiate(withOwner: self, options: nil).first as! UIView
     }
}

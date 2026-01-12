//
//  CommonVC.swift
//  MalayaliDinoGame
//
//  Created by macbook on 09/01/2026.
//

import UIKit

class CommonVC: UIViewController {
    
    let customNavBar: CustomNavBar = CustomNavBar().loadFromNib() as! CustomNavBar
    
    var imgs: [UIImage] = []
    
    var darkImgs: [UIImage] = [
        UIImage(named: "wlcmImgDark")!
    ]
    var lightImgs: [UIImage] = [
        UIImage(named: "wlcmImgLight")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateInterfaceStyle()
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Checks if the color appearance has changed
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateInterfaceStyle()
            updateImages()
        }
    }
    
    func updateInterfaceStyle() {
        // Setup for Dark and Light Mode UI Setup
        switch traitCollection.userInterfaceStyle {
        case .dark:
            print("Dark Mode!")
            imgs = darkImgs
            
        case .light:
            print("Light Mode!")
            imgs = lightImgs
            
        default:
            print("Unspecified!")
            // Setting Dark Mode Images as default
            imgs = darkImgs
        }
    }
    
    /// Subclasses should override this method to update their image views.
    func updateImages() {
        // This will be implemented by subclasses.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func setupUI() {}
    
}

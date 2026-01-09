//
//  ViewController.swift
//  MalayaliDinoGame
//
//  Created by macbook on 18/12/2025.
//

import UIKit

class HomeVC: CommonVC {

    @IBOutlet weak var wlcmImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateImages()
    }
    
    override func updateImages() {
        // First Image is the Welcome Image
        guard !imgs.isEmpty else { return }
        self.wlcmImg.image = imgs[0]
    }

}

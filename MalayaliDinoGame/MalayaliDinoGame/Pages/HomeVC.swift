//
//  ViewController.swift
//  MalayaliDinoGame
//
//  Created by macbook on 18/12/2025.
//

import UIKit

class HomeVC: CommonVC {

    @IBOutlet weak var wlcmImg: UIImageView!
    
    @IBOutlet weak var startBtnV: UIView!
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateImages()
        self.startBtnV.layer.cornerRadius = 5.0
    }
    
    override func updateImages() {
        // First Image is the Welcome Image
        guard !imgs.isEmpty else { return }
        self.wlcmImg.image = imgs[0]
    }

    @IBAction func startBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameVC") as! GameVC
        print("Pushing to GameVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

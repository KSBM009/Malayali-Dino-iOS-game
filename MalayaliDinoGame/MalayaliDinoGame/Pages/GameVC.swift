//
//  GameVC.swift
//  MalayaliDinoGame
//
//  Created by macbook on 09/01/2026.
//

import UIKit

class GameVC: CommonVC {
    
    private var currScore: Int = 0
    private var highScore: Int = 0
    
    private var isGameStart: Bool = false
    private var didCollide: Bool = false
    
    private var dinoPosY: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

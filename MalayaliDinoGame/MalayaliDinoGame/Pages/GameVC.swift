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
    
    var ground1 = UIImageView()
    var ground2 = UIImageView()
    
    var displayLink: CADisplayLink!
    let groundSpeed: CGFloat = 3.0

    @IBOutlet weak var mainGameV: UIView!
    @IBOutlet weak var IssueDisplayV: UIView!
    
    @IBOutlet weak var gameMenuV: UIView!
    
    @IBOutlet weak var startMenuV: UIView!
    @IBOutlet weak var startMenuImgV: UIImageView!
    @IBOutlet weak var startBtnV: UIView!
    
    @IBOutlet weak var pauseBtnV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainGameV.isHidden = true
        gameMenuV.isHidden = false
        
        startBtnV.layer.cornerRadius = 25.0
        
        updateImages()
        
        pauseMenuActivation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        mainGameV.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopGame()
        mainGameV.isHidden = true
    }
    
    override func updateImages() {
        // Second Image is the Image for Start Up Menu
        guard !imgs.isEmpty else { return }
        self.startMenuImgV.image = imgs[1]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupGround() {
        // Prevent duplicate setup
        guard ground1.superview == nil else { return }
        
        let groundHeight: CGFloat = 185
        let yPosition = (mainGameV.frame.height - groundHeight) / 2
        
        print("Main Game View Height: \(mainGameV.frame.height)\nGround Y Position: \(yPosition)")

        ground1.image = UIImage(named: "ground1")
        ground2.image = UIImage(named: "ground2")

        ground1.frame = CGRect(x: 0,
                                y: yPosition,
                                width: mainGameV.frame.width,
                                height: groundHeight)

        ground2.frame = CGRect(x: view.frame.width,
                                y: yPosition,
                                width: mainGameV.frame.width,
                                height: groundHeight)

        mainGameV.addSubview(ground1)
        mainGameV.addSubview(ground2)
    }
    
    func startGroundLoop() {
        displayLink = CADisplayLink(target: self, selector: #selector(updateGround))
        displayLink.add(to: .main, forMode: .common)
    }
    
    func startGame() {
        setupGround()
        
        isGameStart = true
        startGroundLoop()
    }

    @objc func updateGround() {
        ground1.frame.origin.x -= groundSpeed
        ground2.frame.origin.x -= groundSpeed

        // Reset when off-screen
        if ground1.frame.maxX <= 0 {
            ground1.frame.origin.x = ground2.frame.maxX
        }

        if ground2.frame.maxX <= 0 {
            ground2.frame.origin.x = ground1.frame.maxX
        }
    }
    
    func stopGame() {
        displayLink?.invalidate()
        displayLink = nil
        cleanupGround()
    }
    
    func cleanupGround() {
        ground1.removeFromSuperview()
        ground2.removeFromSuperview()
    }

    @IBAction func startBtnClick(_ sender: Any) {
        print("Start Button Clicked")
        
        startGame()
        
        gameMenuV.isHidden = true
        startMenuV.isHidden = true
    }
    
    @IBAction func pauseBtnClick(_ sender: Any) {
        self.gameMenuV.isHidden = false
    }
    
    func pauseMenuActivation() {
        while true {
            self.pauseBtnV.isHidden = !self.gameMenuV.isHidden
        }
    }
    
}

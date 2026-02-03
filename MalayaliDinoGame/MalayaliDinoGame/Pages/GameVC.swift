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
    
    var groundViews: [UIView] {
        return [ground1, ground2]
    }
    
    var ground1 = UIImageView()
    var ground2 = UIImageView()
    
    var displayLink: CADisplayLink!
    var isGamePaused = false
    var baseGameSpeed: CGFloat = 3.0
    var currGameSpeed: CGFloat = 5.0

    @IBOutlet weak var mainGameV: UIView!
    @IBOutlet weak var IssueDisplayV: UIView!
    
    @IBOutlet weak var gameMenuV: UIView!
    
    @IBOutlet weak var startMenuV: UIView!
    @IBOutlet weak var startMenuImgV: UIImageView!
    @IBOutlet weak var startBtnV: UIView!
    
    @IBOutlet weak var pauseMenuV: UIView!
    
    @IBOutlet weak var resumeBtnV: UIView!
    @IBOutlet weak var diffBtnV: UIView!
    @IBOutlet weak var exitBtnV: UIView!
    
    @IBOutlet weak var pauseBtnV: UIView!
    
    @IBOutlet weak var gameElementsV: UIView!
    
    var displayGameMenuV = true
    
    private let dinoImageView = UIImageView()
    
    func setupDino() {
        dinoImageView.frame = CGRect(x: 80, y: dinoPosY, width: 80, height: 80)
        dinoImageView.contentMode = .scaleAspectFit
        dinoImageView.image = UIImage(named: "dino_run_1") // initial frame
        view.addSubview(dinoImageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainGameV.isHidden = true
        
        gameMenuV.isHidden = false
        displayGameMenuV = false
        
        updateImages()
        
        setupDino()
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
        self.startMenuImgV.image = UIImage(named: "dinoImg")
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
        
        dinoPosY = yPosition
        
        print("Main Game View Height: \(groundHeight)\nGround Y Position: \(yPosition)")

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
        
        startDinoRunning()
    }
    
    func startDinoRunning() {
        print("Dino started Running!")
    }
    
    func pauseGame() {
        guard let displayLink = displayLink, !isGamePaused else { return }
        
        // Pause logic
        displayLink.isPaused = true
        isGamePaused = true
        
        // Hide visuals
        groundViews.forEach { $0.isHidden = true }
    }
    
    func pauseDinoRunning() {
        print("Dino paused Running!")
    }
    
    func resumeGame() {
        guard let displayLink = displayLink, isGamePaused else { return }
        
        // Show visuals
        groundViews.forEach { $0.isHidden = false }
        
        // Resume logic
        displayLink.isPaused = false
        isGamePaused = false
    }
    
    func resumeDinoRunning() {
        print("Dino resumes Running!")
    }

    @objc func updateGround() {
        ground1.frame.origin.x -= currGameSpeed
        ground2.frame.origin.x -= currGameSpeed

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
        stopDinoRunning()
        cleanUpDinoRunning()
        cleanupGround()
    }
    
    func cleanupGround() {
        ground1.removeFromSuperview()
        ground2.removeFromSuperview()
    }
    
    func stopDinoRunning() {
        print("Dino stopped Running!")
    }
    
    func cleanUpDinoRunning() {
        print("Dino Views cleanedup/removed!")
    }

    @IBAction func startBtnClick(_ sender: Any) {
        print("Start Button Clicked")
        
        startGame()
        
        setupGameMenuVs(menuType: .none)
    }
    
    @IBAction func pauseBtnClick(_ sender: Any) {
        pauseGame()
        setupGameMenuVs(menuType: .pause)
    }
    
    @IBAction func resumeBtnClick(_ sender: Any) {
        print("Resume Button Clicked")
        
        resumeGame()
        setupGameMenuVs(menuType: .none)
    }
    
    @IBAction func difficultyBtnClick(_ sender: Any) {
        print("Difficulty Button Clicked")
    }
    
    @IBAction func exitBtnClick(_ sender: Any) {
        print("Exit Button Clicked")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupGameMenuVs(menuType: gameMenusType) {
        gameMenuV.isHidden = false
        displayGameMenuV = false
        self.pauseBtnV.isHidden = true
        self.gameElementsV.isHidden = true
        
        switch menuType {
        case .start:
            print("Start Menu Setup!")
            
            self.startMenuV.isHidden = false
            self.pauseMenuV.isHidden = true
            
        case .pause:
            print("Pause Menu Setup!")
            
            self.startMenuV.isHidden = true
            self.pauseMenuV.isHidden = false
            
        case .none:
            print("Removing all the Menu Setups!")
            
            self.gameMenuV.isHidden = true
            displayGameMenuV = true
            self.pauseBtnV.isHidden = false
            self.gameElementsV.isHidden = false
            
            self.startMenuV.isHidden = true
            self.pauseMenuV.isHidden = true
        }
    }
    
    enum gameMenusType {
        case start
        case pause
        case none
    }
}

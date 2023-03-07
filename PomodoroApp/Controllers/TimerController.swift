//
//  TimerController.swift
//  PomodoroApp
//
//  Created by Mahmut Senbek on 6.03.2023.
//

import UIKit
import AVFoundation
import MediaPlayer

class TimerController: UIViewController {
    //MARK: - Properties
    
    //View properties
    let timerView = TimerView()
    
    //Bool properties
    var isTimerStarted = false
    var isAnimationStarted = false
    var isSoundPlaying = false
    
    //Time Properties
    var timer = Timer()
    var totalTime = 0
    var timeLeft = 0
    
    //Animation Properties
    let foreProgressLayer = CAShapeLayer()
    let backProgressLayer = CAShapeLayer()
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    //Sound properties
    var player: AVAudioPlayer!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        drawBackLayer()
      
        
    }
    
    //MARK: - Functions
    
   
    
    func whenTimeSelected() {
        timerView.timeLabel.text = formatTime()
        timer.invalidate()
        timeLeft = totalTime
        timerView.stopButton.isEnabled = false
        timerView.stopButton.alpha = 1.0
        timerView.startButton.setImage(UIImage(systemName: "play"), for: .normal)
        timerView.startButton.tintColor = UIColor.systemGreen
        timerView.startButton.isEnabled = true
        isTimerStarted = false
        isAnimationStarted = false
        resetAnimation()
        timerView.sessionInfoLabel.isHidden = false
        timerView.sessionInfoLabel.text = "\(formatTime()) min session ⏰"
        
    }
    
    //Start time function
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    //Updating time every seceond
    @objc func updateTimer() {
        
        if totalTime < 1 {
            
            timerView.stopButton.isEnabled = false
            timerView.stopButton.alpha = 0.5
            timerView.startButton.setImage(UIImage(systemName: "play"), for: .normal)
            timerView.startButton.tintColor = UIColor.systemGreen
            timer.invalidate()
            isTimerStarted = false
            timerView.timeLabel.text = formatTime()
        }else {
            totalTime -= 1
            timerView.timeLabel.text = formatTime()
        }
        
    }
    //Total time string
    func formatTime() -> String {
        let minutes = Int(totalTime) / 60 % 60
        let seconds = Int(totalTime) % 60
        return String(format: "%02i:%02i", minutes, seconds)
        
    }
    //Left time string
    func formatTimeLeft() -> String {
        let minutes = Int(timeLeft) / 60 % 60
        let seconds = Int(timeLeft) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    //background layer
    func drawBackLayer() {
        backProgressLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.midY), radius: 100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        backProgressLayer.strokeColor = UIColor.black.cgColor
        backProgressLayer.fillColor = UIColor.clear.cgColor
        backProgressLayer.lineWidth = 10
        view.layer.addSublayer(backProgressLayer)
    }
    
    // fore layer which is the animated one
    func drawForeLayer() {
        foreProgressLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.midY), radius: 100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        foreProgressLayer.strokeColor = UIColor.white.cgColor
        foreProgressLayer.fillColor = UIColor.clear.cgColor
        foreProgressLayer.lineWidth = 10
        view.layer.addSublayer(foreProgressLayer)
    }
    
    func playSound(forResource : String , withExtension : String) {
        if let audioPlayer = player, audioPlayer.isPlaying { audioPlayer.stop() }
        
        guard let soundURL = Bundle.main.url(forResource: forResource, withExtension: withExtension) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: soundURL)
            player.numberOfLoops = -1
            isSoundPlaying = true
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    
}


//MARK: - Actions

extension TimerController {
    
    //VolumeSlider When Change
    @objc func sliderValueDidChange(_ sender : UISlider) {
        if player != nil {
            player.volume = timerView.volumeSlider.value
    
        }
    }
    
    @objc func musicPopUpBtnClicked() {
        let optionClosure = {(action : UIAction) in
            print("sdasfasfafas")
        }
        let songOne = { [self](action : UIAction) in
            
            guard let titleText = timerView.musicPopUpButton.titleLabel?.text else {return}
            if isSoundPlaying {
                playSound(forResource: titleText, withExtension: "mp3")
            }
            timerView.stopMusicButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        }
        let songTwo = { [self](action: UIAction) in
            guard let titleText = timerView.musicPopUpButton.titleLabel?.text else {return}
            if isSoundPlaying {
                playSound(forResource: titleText, withExtension: "mp3")
            }
            timerView.stopMusicButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            
        }
        let songThree = { [self](action: UIAction) in
            guard let titleText = timerView.musicPopUpButton.titleLabel?.text else {return}
            if isSoundPlaying {
                playSound(forResource: titleText, withExtension: "mp3")
            }
            timerView.stopMusicButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        }
        
        
        
        timerView.musicPopUpButton.menu = UIMenu(children: [
            UIAction(title: "Musics", state: .on, handler: optionClosure),
            UIAction(title: "Song 1",subtitle: "", image: UIImage(systemName: "speaker.circle"), state: .on, handler: songOne),
            UIAction(title: "Song 2",subtitle: "", image: UIImage(systemName: "speaker.circle"), state: .on, handler: songTwo),
            UIAction(title: "Song 3",subtitle: "", image: UIImage(systemName: "speaker.circle"), state: .on, handler: songThree),
            
        ])
        
        timerView.musicPopUpButton.showsMenuAsPrimaryAction = true
        timerView.musicPopUpButton.changesSelectionAsPrimaryAction = true
        
    }
    
    
    @objc func musicStopButtonClicked(_ sender : UIButton) {
        
        if isSoundPlaying {
            isSoundPlaying = false
            player.stop()
            timerView.stopMusicButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        }
        
    }
    
    @objc func startMusicButtonClicked(_ sender : UIButton) {
        
        if !isSoundPlaying {
            
            guard let titleText = timerView.musicPopUpButton.titleLabel?.text else {return}
            if timerView.musicPopUpButton.titleLabel?.text != "Musics" {
                playSound(forResource: titleText, withExtension: "mp3")
                player.play()
                timerView.stopMusicButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            }
            
        }
    }
    
    @objc func studyTimePopUpButtonClicked() {
        //        let optionClosure = {(action : UIAction) in
        //
        //        }
        let twentyfiveMın = { [self](action : UIAction) in
            self.totalTime = 25 * 60
            whenTimeSelected()
        }
        let thirtyfiveMın = { [self](action: UIAction) in
            self.totalTime = 35 * 60
            whenTimeSelected()
        }
        let fortyfiveMın = { [self](action: UIAction) in
            self.totalTime = 45 * 60
            whenTimeSelected()
        }
        let fiftyfiveMın = { [self](action: UIAction) in
            self.totalTime = 55 * 60
            whenTimeSelected()
        }
        
        
        timerView.studyTimePopUpButton.menu = UIMenu(children: [
            //   UIAction(title: "How many minutes do you want to study?", state: .on, handler: optionClosure),
            UIAction(title: "25 minute",subtitle: "", image: UIImage(systemName: "clock"), handler: twentyfiveMın),
            UIAction(title: "35 minute",subtitle: "", image: UIImage(systemName: "clock"), handler: thirtyfiveMın),
            UIAction(title: "45 minute",subtitle: "", image: UIImage(systemName: "clock"), handler: fortyfiveMın),
            UIAction(title: "55 minute",subtitle: "", image: UIImage(systemName: "clock"), handler: fiftyfiveMın),
        ])
        
        
        
        timerView.studyTimePopUpButton.showsMenuAsPrimaryAction = true
       // timerView.studyTimePopUpButton.changesSelectionAsPrimaryAction = true
        
        
    }
    
    @objc func startTimeButtonClicked(_ sender: UIButton) {
        timerView.stopButton.isEnabled = true
        timerView.stopButton.alpha = 1.0
        UIView.animate(withDuration: 0.5, delay: 0.2) {
            self.timerView.studyTimePopUpButton.alpha = 0
            self.timerView.studyTimePopUpButton.isHidden = false
            
        }
        
        if !isTimerStarted {
            
            drawForeLayer()
            startResumeAnimation()
            startTimer()
            isTimerStarted = true
            timerView.startButton.setImage(UIImage(systemName: "pause"), for: .normal)
            timerView.startButton.tintColor = UIColor.systemBlue
            timerView.stopButton.tintColor = UIColor.systemRed
            
            
        }else {
            pauseAnimation()
            timer.invalidate()
            isTimerStarted = false
            timerView.startButton.setImage(UIImage(systemName: "play"), for: .normal)
            timerView.startButton.tintColor = UIColor.systemGreen
        }
    }
    
    @objc func stopTimeButtonClicked(_ sender: UIButton) {
        stopAnimation()
        timerView.stopButton.isEnabled = false
        timerView.stopButton.alpha = 0.5
        timerView.startButton.setImage(UIImage(systemName: "play"), for: .normal)
        timerView.startButton.tintColor = UIColor.systemGreen
        timer.invalidate()
        isTimerStarted = false
        totalTime = timeLeft
        timerView.timeLabel.text = formatTimeLeft()
        resetAnimation()
        
        if timerView.musicPopUpButton.titleLabel?.text != "Musics" {
            player.stop()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2) {
            self.timerView.studyTimePopUpButton.alpha = 1
            self.timerView.studyTimePopUpButton.isHidden = false
            
        }
        
    }
    
    
    
}

//MARK: - Animations Func and Delegates

extension TimerController: CAAnimationDelegate {
    
    func startResumeAnimation() {
        if !isAnimationStarted {
            startAnimation()
            
        }else {
            resumeAnimation()
        }
    }
    
    func startAnimation() {
        resetAnimation()
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = CFTimeInterval(totalTime)
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: "strokeEnd")
        isAnimationStarted = true
    }
    
    func resetAnimation() {
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        foreProgressLayer.strokeEnd = 0.0
        isAnimationStarted = false
    }
    
    func pauseAnimation() {
        
        let pausedTime = foreProgressLayer.convertTime(CACurrentMediaTime(), from: nil)
        
        foreProgressLayer.speed = 0.0
        foreProgressLayer.timeOffset = pausedTime
        
    }
    
    func resumeAnimation() {
        let pausedTime = foreProgressLayer.timeOffset
        foreProgressLayer.speed = 1
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        let timeSincePaused = foreProgressLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        foreProgressLayer.beginTime = timeSincePaused
        
        
    }
    
    func stopAnimation() {
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        foreProgressLayer.strokeEnd = 0.0
        foreProgressLayer.removeAllAnimations()
        isAnimationStarted = false
    }
    
    internal func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        stopAnimation()
    }
}


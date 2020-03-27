//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var player: AVAudioPlayer!
    var secondsRemaining = 0
    var totalTime:Int? = nil
    
    @IBAction func chooseHardness(_ sender: UIButton) {
        timer.invalidate()
        secondsRemaining = 0
        progressBar.progress = 0
        
        label.text = "Cooking..."
        totalTime = eggTimes[sender.currentTitle!]
        if totalTime != nil {timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)}
    }
    
    @objc func updateCounter(){
        if secondsRemaining < totalTime!{
            secondsRemaining += 1
            progressBar.progress = Float(secondsRemaining)/Float(totalTime!)
        }else{
            timer.invalidate()
            label.text = "Done!!!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}

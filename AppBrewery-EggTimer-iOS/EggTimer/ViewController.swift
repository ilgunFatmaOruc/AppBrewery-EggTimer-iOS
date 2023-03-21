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
    var player: AVAudioPlayer?
   // @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //let softTime=5
   // let mediumTime=8
    //let hardTime=12
    
    let eggTimes = ["Soft": 3,"Medium": 5,"Hard": 7]
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var array = [Int]()

    @IBOutlet weak var timeBar: UIProgressView!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        let hardness=sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
       
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        timeBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        //self.timeBar.setProgress(10.0, animated: true)
          
      //timerAction()
       
    }
    
    /*@objc func timerAction(){
       if timeBar.progress >= 1.0 {
           timer.invalidate()
           return
       }


       timeBar.setProgress(timeBar.progress + 1.0, animated: true)
    }*/
    
    @objc func updateCounter() {
        
        
        if secondsPassed < totalTime {
            secondsPassed+=1
            timeBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
        }
        // TimerLabel.text =NSString(format:"%02d:%02d",seconds/60,seconds%60)
        else{
            timer.invalidate()
             titleLabel.text = "Finish"

          let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    
                    player = try! AVAudioPlayer(contentsOf: url!)

                    guard let player = player else { return }

                    player.play()

           
        }
        
       
        
        
    }
       
                
                
        
        
        
        /*Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.secondsRemaining -= 1
            } else {
                Timer.invalidate()

         }       }*/
        
        
        /*switch hardness {
        case "Soft":
            print(eggTimes["Soft"])
        case "Medium":
            print(eggTimes["Medium"])
        case "Hard":
            print(eggTimes["Hard"])
        default:
            print("Error")
        }
        */
        
        
        
       /* switch hardness{
        case "Soft":
            print(5)
        case "Medium":
            print(7)
        case "Hard":
            print(12)
        default:
            print(" Error!")
            
        }*/
        
        
        
        /*if(hardness=="Soft")
            {
            print(softTime)
        }
        else if(hardness=="Medium")
        {
            print(mediumTime)
        }
        else if(hardness=="Hard")
        {
            print(hardTime)
        }*/
   
    
}

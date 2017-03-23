//
//  ViewController.swift
//  timer
//
//  Created by 田尻智子 on 2017/03/23.
//  Copyright © 2017年 tomooty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer(timer: Timer) {
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
    }
    
    @IBAction func startTimer(_ sender: Any) {
       if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
        
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil
                
        }
    }
    @IBAction func resetTimer(_ sender: Any) {
            self.timer_sec = 0
            self.timerLabel.text = String(format: "%.1f", self.timer_sec)
            
            if self.timer != nil {
                self.timer.invalidate()   // 現在のタイマーを破棄する
                self.timer = nil
            }
            
            
}
}

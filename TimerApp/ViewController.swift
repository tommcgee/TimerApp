//
//  ViewController.swift
//  TimerApp
//
//  Created by Tom McGee on 9/9/16.
//  Copyright © 2016 Tom McGee. All rights reserved.
//

import UIKit
import Foundation

public class ViewController: UIViewController {
    public var seconds: Double = 0.00
    public var running: Bool = false
    @IBOutlet public weak var TimerLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        scheduledTimerWithTimeInterval()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction public func startTimer() {
        running = true
    }
    
    @IBAction public func stopTimer() {
        running = false
    }

    @IBAction func resetTimer() {
        seconds = 0.00
        displayTime(TimerLabel)
    }
    
    
    func scheduledTimerWithTimeInterval(){
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(self.tick), userInfo: nil, repeats: true)
    }
    
    public func tick() {
        updateTimer()
        displayTime(TimerLabel)
    }
    
    public func updateTimer() {
        if (running) {
            seconds += 0.1
        }
    }
    
    public func displayTime(timerLabel: UILabel) {
        let minutes = getFormattedMinutes(seconds)
        let formattedSeconds = getFormattedSeconds(seconds)
        let currentTime = "\(minutes):\(formattedSeconds)"
        timerLabel.sizeToFit()
        timerLabel.text = currentTime
    }
    
    public func getFormattedMinutes(seconds: Double) -> Int{
        return Int(floor(seconds / 60.0))
    }
    
    public func getFormattedSeconds(seconds: Double) -> Double {
        return Double(round(10 * (seconds % 60.0)) / 10)
    }
}


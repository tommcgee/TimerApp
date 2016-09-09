import UIKit
import Foundation
public class TimerLabelView: UILabel, TimerView {
    public var running = false
    public var seconds: Double = 0.00
    public var timer = NSTimer()
    
    
    public func start(){
        running = true
        scheduledTimerWithTimeInterval()
    }
    
    public func stop() {
        running = false
        timer.invalidate()
    }
    
    public func reset() {
        seconds = 0.00
        displayTime()
    }
    
    public func tick() {
        updateTimer()
        displayTime()
    }
    
    public func updateTimer() {
        if (running) {
            seconds += 0.1
        }
    }
    
    public func displayTime() {
        let minutes = getFormattedMinutes(seconds)
        let formattedSeconds = getFormattedSeconds(seconds)
        let currentTime = "\(minutes):\(formattedSeconds)"
        self.sizeToFit()
        self.text = currentTime
    }
    
    public func getFormattedMinutes(seconds: Double) -> Int{
        return Int(floor(seconds / 60.0))
    }
    
    public func getFormattedSeconds(seconds: Double) -> Double {
        return Double(round(10 * (seconds % 60.0)) / 10)
    }
    
    
    func scheduledTimerWithTimeInterval(){
         timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(self.tick), userInfo: nil, repeats: true)
    }
}
import Foundation

public class MockTimerView: NSObject, TimerView {
    public var running = false
    public var hasBeenReset = false
    
    public func start() {
        running = true
        
    }
    
    public func stop() {
        running = false
        
    }
    
    public func reset() {
        hasBeenReset = true
    }
}
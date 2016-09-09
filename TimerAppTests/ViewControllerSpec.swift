import TimerApp
import Quick
import Nimble
import UIKit

class ViewControllerSpec: QuickSpec {
    override func spec() {
        var controller: ViewController!
        var mockTimer: MockTimerView!
        beforeEach() {
            controller = ViewController()
            mockTimer = MockTimerView()
            controller.timer = mockTimer
        }
        
        describe("ViewController") {
            it ("can start the timer") {
                controller.startTimer()
                expect(mockTimer.running).to(beTrue())
            }
            
            it ("can stop the timer") {
                mockTimer.running = true
                controller.stopTimer()
                expect(mockTimer.running).to(beFalse())
            }
            
            it ("can clear the timer") {
                controller.resetTimer()
                expect(mockTimer.hasBeenReset).to(beTrue())
            }
            
        }
        
    }
}

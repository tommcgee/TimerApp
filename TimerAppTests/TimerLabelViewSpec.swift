import TimerApp
import Quick
import Nimble
import UIKit

class TimerLabelViewSpec: QuickSpec {
    override func spec() {
        var timer: TimerLabelView!
        
        beforeEach() {
            timer = TimerLabelView()
        }
        
        describe("TimerLabelView") {
            it ("can set running to true when the timer is started") {
                timer.start()
                expect(timer.running).to(beTrue())
            }
            
            it ("isn't running when the app is launched")
            {
                expect(timer.running).to(beFalse())
            }
            
            it ("can stop the timer from running") {
                timer.running = true
                timer.stop()
                expect(timer.running).to(beFalse())
            }
            
            it ("can update the timer if it is running") {
                timer.running = true;
                timer.seconds = 0.0;
                timer.updateTimer();
                expect(timer.seconds).to(equal(0.1))
            }
            
            it ("does not update the timer if it is not running") {
                timer.running = false;
                timer.seconds = 0.0;
                timer.updateTimer();
                expect(timer.seconds).to(equal(0.0))
            }
            
            it ("can get the correct minute based on seconds") {
                let minutes = timer.getFormattedMinutes(125)
                expect(minutes).to(equal(2))
            }
            
            it ("can get the correct minute based on seconds before a new minute") {
                let minutes = timer.getFormattedMinutes(119)
                expect(minutes).to(equal(1))
            }
            
            it ("can correctly format the seconds to one decimal places rounding down") {
                let formattedSeconds = timer.getFormattedSeconds(1.1234)
                expect(formattedSeconds).to(equal(1.1))
            }
            
            it ("can correctly format the seconds to one decimal places rounding up") {
                let formattedSeconds = timer.getFormattedSeconds(1.1834)
                expect(formattedSeconds).to(equal(1.2))
            }
            
            it ("can update the text of a label and display the time") {
                timer.seconds = 30.0;
                timer.displayTime()
                expect(timer.text!).to(equal("0:30.0"))
            }
            
            it ("can update the label text with a time larger than a minute") {
                timer.seconds = 90.0;
                timer.displayTime()
                expect(timer.text!).to(equal("1:30.0"))
            }
            
            it("can reset the time of the label text") {
                timer.text = "1:23.3"
                timer.reset()
                expect(timer.text!).to(equal("0:0.0"))
            }
            
            it("can pass a sample test") {
                expect(true).to(beTrue())
            }
        }
    }
}
import TimerApp
import Quick
import Nimble
import UIKit

class ViewControllerSpec: QuickSpec {
    override func spec() {
        var controller: ViewController!
        let sampleButton = UIButton()
        beforeEach() {
            controller = ViewController()
        }
        
        describe("ViewController") {
            
            it ("can set running to true when the timer is started") {
                controller.startTimer(sampleButton)
                expect(controller.running).to(beTrue())
            }
            
            it ("isn't running when the app is launched")
            {
                expect(controller.running).to(beFalse())
            }
            
            it ("can set stop the timer from running") {
                controller.running = true
                controller.stopTimer(sampleButton)
                expect(controller.running).to(beFalse())
            }
            
            it ("can update the timer if it is running") {
                controller.running = true;
                controller.seconds = 0.0;
                controller.updateTimer();
                expect(controller.seconds).to(equal(0.1))
            }
            
            it ("does not update the timer if it is not running") {
                controller.running = false;
                controller.seconds = 0.0;
                controller.updateTimer();
                expect(controller.seconds).to(equal(0.0))
            }
            
            it ("can get the correct minute based on seconds") {
                let minutes = controller.getFormattedMinutes(125)
                expect(minutes).to(equal(2))
            }
            
            it ("can get the correct minute based on seconds before a new minute") {
                let minutes = controller.getFormattedMinutes(119)
                expect(minutes).to(equal(1))
            }
            
            it ("can correctly format the seconds to one decimal places rounding down") {
                let formattedSeconds = controller.getFormattedSeconds(1.1234)
                expect(formattedSeconds).to(equal(1.1))
            }
            
            it ("can correctly format the seconds to one decimal places rounding up") {
                let formattedSeconds = controller.getFormattedSeconds(1.1834)
                expect(formattedSeconds).to(equal(1.2))
            }
            
            it ("can update the text of a label and display the time") {
                let label = UILabel()
                controller.seconds = 30.0;
                controller.displayTime(label)
                expect(label.text!).to(equal("0:30.0"))
            }
            
            it ("can update the label text with a time larger than a minute") {
                let label = UILabel()
                controller.seconds = 90.0;
                controller.displayTime(label)
                expect(label.text!).to(equal("1:30.0"))
            }
            
            it("can reset the time of the label text") {
                let label = UILabel()
                label.text = "1:23.3"
                controller.TimerLabel = label
                
                controller.resetTimer(label)
                expect(label.text!).to(equal("0:0.0"))
            }
            
            it("can pass a sample test") {
                expect(true).to(beTrue())
            }
        }
        
    }
}

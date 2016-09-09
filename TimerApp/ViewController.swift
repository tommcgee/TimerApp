import UIKit
import Foundation

public class ViewController: UIViewController {
    public var seconds: Double = 0.00
    public var running: Bool = false
    @IBOutlet public weak var timer: TimerView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction public func startTimer() {
        timer.start()
    }
    @IBAction public func stopTimer() {
        timer.stop()
    }
    @IBAction public func resetTimer() {
        timer.reset()
    }
}


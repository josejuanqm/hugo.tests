//
//  ViewController.swift
//  Timer
//
//  Created by Jose Quintero on 12/4/20.
//

import UIKit

class ViewController: UIViewController {
    
    let stopwatch: Stopwatch = Stopwatch()
    let sId = Identifiable.subscriber("ViewController")

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        progressView.progress = 1
        timerLabel.text = "0s"
        durationSlider.maximumValue = 60
        stopwatch.subscribe(self, with: sId)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopwatch.unsubscribe(id: sId)
    }
    
    @IBAction func reset(sender: UIButton) {
        if stopwatch.isRunning {
            sender.setTitle("Start", for: .normal)
            stopwatch.reset()
        } else {
            sender.setTitle("Reset", for: .normal)
            stopwatch.start(with: TimeInterval(durationSlider.value))
        }
    }

}

// MARK: Stopwatch Delegate
extension ViewController: TimerDelegate {
    func tick(with current: TimeInterval, total: TimeInterval) {
        let value = Float((total - current) / total)
        let remainder = Int(total - current)
        progressView.setProgress(value, animated: true)
        timerLabel.text = "\(remainder)s"
        
        if (remainder == 0) {
            actionButton.setTitle("Start", for: .normal)
            progressView.setProgress(1, animated: true)
        }
    }
}

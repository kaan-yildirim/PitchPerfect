//
//  ViewController.swift
//  PitchPerfect
//
//  Created by KAAN YILDIRIM on 17.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func recordButtonPressed(_ sender: Any) {
        recordLabel.text = "Record in progress"
        stopRecordButton.isEnabled = true
        recordButton.isEnabled = false
    }

    @IBAction func stopRecordButtonPressed(_ sender: Any) {
        recordLabel.text = "Tap to record"
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true
    }
}


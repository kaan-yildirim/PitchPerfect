//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by KAAN YILDIRIM on 17.11.2021.
//

import UIKit

final class RecordSoundsViewController: UIViewController {

    @IBOutlet weak private var recordButton: UIButton!
    @IBOutlet weak private var recordLabel: UILabel!
    @IBOutlet weak private var stopRecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction private func recordButtonPressed(_ sender: Any) {
        recordLabel.text = "Record in progress"
        stopRecordButton.isEnabled = true
        recordButton.isEnabled = false
    }

    @IBAction private func stopRecordButtonPressed(_ sender: Any) {
        recordLabel.text = "Tap to record"
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true
    }
}


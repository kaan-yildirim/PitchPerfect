//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by KAAN YILDIRIM on 17.11.2021.
//

import UIKit
import AVFoundation

final class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak private var recordButton: UIButton!
    @IBOutlet weak private var recordLabel: UILabel!
    @IBOutlet weak private var stopRecordButton: UIButton!

    private var recorder: AVAudioRecorder!
    
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

        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! recorder = AVAudioRecorder(url: filePath!, settings: [:])
        recorder.isMeteringEnabled = true
        recorder.delegate = self
        recorder.prepareToRecord()
        recorder.record()
    }

    @IBAction private func stopRecordButtonPressed(_ sender: Any) {
        recordLabel.text = "Tap to record"
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true

        recorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        <#code#>
    }
}


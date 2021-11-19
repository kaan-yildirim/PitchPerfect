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
    enum RecordingState { case recording, notRecording }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(text: "Tap to record", status: .notRecording)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func configureUI(text: String, status: RecordingState) {
        recordLabel.text = text
        recordButton.isEnabled = status == .notRecording
        stopRecordButton.isEnabled = status == .recording
    }

    @IBAction private func recordButtonPressed(_ sender: Any) {
        configureUI(text: "Record in progress", status: .recording)

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
        configureUI(text: "Tap to record", status: .notRecording)

        recorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playVC = segue.destination as! PlaySoundsViewController
            let recordedURL = sender as! URL
            playVC.recordedURL = recordedURL
        }
    }

    // MARK: - Audio Recorder Delegate

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: recorder.url)
        }
    }
}


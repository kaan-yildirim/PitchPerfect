//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by KAAN YILDIRIM on 18.11.2021.
//

import UIKit

final class PlaySoundsViewController: UIViewController {

    @IBOutlet private weak var snailButton: UIButton!
    @IBOutlet private weak var chipmunkButton: UIButton!
    @IBOutlet private weak var rabbitButton: UIButton!
    @IBOutlet private weak var vaderButton: UIButton!
    @IBOutlet private weak var echoButton: UIButton!
    @IBOutlet private weak var reverbButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    var recordedURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
    }
}

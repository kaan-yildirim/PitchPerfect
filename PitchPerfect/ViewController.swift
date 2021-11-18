//
//  ViewController.swift
//  PitchPerfect
//
//  Created by KAAN YILDIRIM on 17.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recordButtonPressed(_ sender: Any) {
        recordLabel.text = "Record in progress"
    }

    @IBAction func stopRecordButtonPressed(_ sender: Any) {
    }
}


//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Chetan Bhasin on 01.09.18.
//  Copyright © 2018 Chetan Bhasin. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startRecording(_ sender: Any) {
        print("Strting recording")
        recordingLabel.text = "Recording"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("Stop recording")
        recordingLabel.text = "Stop recording"
    }
    
    
}


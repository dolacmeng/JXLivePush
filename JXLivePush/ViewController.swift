//
//  ViewController.swift
//  JXLivePush
//
//  Created by 许伟杰 on 2019/1/27.
//  Copyright © 2019 JackXu. All rights reserved.
//

import UIKit
import LFLiveKit

class ViewController: UIViewController {
    //MARK: - Getters and Setters
    lazy var session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.default()
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: .low3, outputImageOrientation: .portrait)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        
        session?.preView = self.view
        return session!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func startLive(_ sender: UIButton) {
        let stream = LFLiveStreamInfo()
        stream.url = "rtmp://192.168.1.104:1935/rtmplive/demo";
        session.startLive(stream)
        session.running = true
    }

    @IBAction func stopLive(_ sender: UIButton) {
        session.stopLive()
    }


}

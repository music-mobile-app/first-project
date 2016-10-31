//
//  ViewController.swift
//  SwiftPiano
//
//  Created by Wataru Nishie on 2016/10/30.
//  Copyright © 2016年 Wataru Nishie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let pianoKeys = ["C3","C#","D","D#","E","F","F#","G","G#","A","A#","B","B#"]
    var audioPlayers:[AVAudioPlayer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var audioPlayer:AVAudioPlayer!
        
        for key in pianoKeys {
            
            let pianoSoundURL = URL(fileURLWithPath: key + ".mp3")
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: pianoSoundURL)
            } catch let error as NSError {
                audioPlayer = nil
            }
            audioPlayer.prepareToPlay()
            audioPlayers.append(audioPlayer)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


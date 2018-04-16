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

    // コメント追加
    let pianoKeys = ["C3","C#","D","D#","E","F","F#","G","G#","A","A#","B","C4"]
    var audioPlayersAif:[AVAudioPlayer] = []
    var audioPlayersMp3:[AVAudioPlayer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var audioPlayer:AVAudioPlayer!
        
        for key in pianoKeys {
            var path:String = "";
            var type:String = "";
            path = "sp_sounds/" + key
            //-----------------------------------------------
            // mp3
            //-----------------------------------------------
            type = "mp3"
            var audioPath = Bundle.main.path(forResource: path, ofType:type)!
            var pianoSoundURL = URL(fileURLWithPath: audioPath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: pianoSoundURL)
            } catch let error as NSError {
                audioPlayer = nil
            }
            audioPlayer.prepareToPlay()
            audioPlayersMp3.append(audioPlayer)
            //-----------------------------------------------
            // aif
            //-----------------------------------------------
            type = "aif"
            audioPath = Bundle.main.path(forResource: path, ofType:type)!
            pianoSoundURL = URL(fileURLWithPath: audioPath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: pianoSoundURL)
            } catch let error as NSError {
                audioPlayer = nil
            }
            audioPlayer.prepareToPlay()
            audioPlayersAif.append(audioPlayer)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playkey(sender: UIButton){
        let keynum = sender.tag
        audioPlayersAif[keynum].currentTime = 0
        audioPlayersAif[keynum].play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


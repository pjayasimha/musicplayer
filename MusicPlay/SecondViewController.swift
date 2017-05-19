//
//  SecondViewController.swift
//  MusicPlay
//
//  Created by Sebastian Hette on 26.01.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    
    @IBOutlet weak var playPauseObj: UIButton!
    var playImg = UIImage(named: "Play-30")
    var pauseImg = UIImage(named: "Pause-30")
    var isPlayOrPause : Bool!
    //play and pausing
    @IBAction func playPauseClick(_ sender: Any) {
        if(!isPlayOrPause)
        {
            playPauseObj.setImage(pauseImg, for: UIControlState.normal)
            isPlayOrPause = true
            
                    if audioStuffed == true && audioPlayer.isPlaying == false
                    {
                        audioPlayer.play()
                    }
        }
        else{
            playPauseObj.setImage(playImg, for: UIControlState.normal)
            isPlayOrPause = false
            if audioStuffed == true && audioPlayer.isPlaying
                    {
                        audioPlayer.pause()
                    }
        }
        
        
        
    }
    
    @IBAction func prev(_ sender: Any)
    {
        if thisSong != 0 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    @IBAction func next(_ sender: Any)
    {
        if thisSong < songs.count-1 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong+1])
            thisSong += 1
            label.text = songs[thisSong]
        }
        else
        {
            
        }
    }
    
    @IBAction func slider(_ sender: UISlider)
    {
        if audioStuffed == true
        {
            audioPlayer.volume = sender.value
            
        }
    }
    
    func playThis(thisOne:String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print ("ERROR")
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        label.text = songs[thisSong]
        isPlayOrPause = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


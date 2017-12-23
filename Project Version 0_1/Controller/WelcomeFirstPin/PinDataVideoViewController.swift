//
//  PinDataVideoViewController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 23.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import AVKit


class PinDataVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        playVideo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playVideo() {
        
        if let path = Bundle.main.path(forResource: "small", ofType: "3gp") {
            
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                
                video.play()
                
            })
            
        }
        
    }
    

    

}

//
//  ViewController.swift
//  LoginChallenge
//
//  Created by Maria Fernanda on 19/3/20.
//  Copyright © 2020 Maria Fernanda. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpelements()
    }

    override func viewWillAppear(_ animated: Bool) {
        // Set up video in the background
        setUpVideo()
    }
    
    func setUpelements(){
        // Style the elements in the View
        CustomUtils.styleFilledButton(signUpButton)
        CustomUtils.styleHollowButton(loginButton)
    }
    
    func setUpVideo(){
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        
        guard bundlePath != nil else { return }
        
        // Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(
            x:-self.view.frame.size.width * 1.4, // Moving to left
            y: 0,
            width: self.view.frame.size.width * 4,  // 4 times of the size of the screen.
            height: self.view.frame.size.height)
        
//        videoPlayerLayer?.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 1.1)
        
    }
    
    // This is to be called in the back buttons to return to this screen
    @IBAction func unwindToOne(_ sender: UIStoryboardSegue){ }

}


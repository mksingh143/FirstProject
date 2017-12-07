//
//  VideoPlayerViewController.swift
//  SuspireTV
//
//  Created by Manoj Kumar Singh on 07/12/17.
//  Copyright © 2017 SoftIndigo. All rights reserved.
//

import UIKit
import AVKit

class VideoPlayerViewController: UIViewController {
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var videoUrl = ""
    var videoTitle = ""
    var videoInfo = ""
    

    var player = AVPlayer()
    var playerController = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        videoName.text = videoTitle
        infoLabel.text = videoInfo
        playVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func playVideo() {
        let url = NSURL(string: videoUrl)
        player = AVPlayer(url: url! as URL)
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.view.frame = CGRect(x: 0, y: 44, width: 1920, height: 992)
        playerView.addSubview(playerController.view)
        player.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

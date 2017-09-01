//
//  PostViewController.swift
//  uTunes
//
//  Created by rightmeow on 8/30/17.
//  Copyright © 2017 Duckensburg. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()

class PostViewController: UIViewController {

    var selectedPost: Post?

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBAction func handlePlay(_ sender: UIButton) {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
        }
    }

    @IBAction func handlePause(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
    }

    func downloadTrack(completion: @escaping () -> Void) {
        guard let previewUrl = selectedPost?.previewUrl, let url = URL(string: previewUrl) else { return }
        activityIndicator.startAnimating()
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            self.activityIndicator.stopAnimating()
            if let err = error {
                print(err.localizedDescription)
            } else {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        try audioPlayer = AVAudioPlayer(data: data)
                        completion()
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            }
        }.resume()
    }

    private func updateView() {
        guard let post = selectedPost else { return }
        self.trackNameLabel.text = post.trackName
        downloadTrack { [weak self] in
            audioPlayer.play()
            self?.playButton.isEnabled = true
            self?.pauseButton.isEnabled = true
        }
    }

    private func setupView() {
        playButton.isEnabled = false
        pauseButton.isEnabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateView()
    }

}
















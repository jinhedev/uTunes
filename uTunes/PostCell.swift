//
//  PostCell.swift
//  uTunes
//
//  Created by rightmeow on 8/30/17.
//  Copyright © 2017 Duckensburg. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    var post: Post? {
        didSet {
            updateCell()
        }
    }

    private func updateCell() {
        if let unwrappedPost = self.post {
            self.genreLabel.text = unwrappedPost.primaryGenreName
            self.titleLabel.text = unwrappedPost.trackName
            self.subTitleLabel.text = unwrappedPost.collectionName
            // download image
            if let url = unwrappedPost.artworkUrl60, !url.isEmpty {
                self.postImageView.loadImageUsingCacheWithURLString(url)
            }
        }
    }

    static let id = String(describing: PostCell.self)

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var postImageView: CustomUIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    private func setupCell() {
        self.backgroundColor = Color.midNightBlack
        self.genreLabel.textColor = Color.lightGray
        self.titleLabel.textColor = Color.white
        self.subTitleLabel.textColor = Color.lightGray
        self.postImageView.image = #imageLiteral(resourceName: "Image Placeholder")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

}




















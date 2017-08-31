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
        //
    }

    static let id = String(describing: PostCell.self)

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    private func setupCell() {
        self.backgroundColor = Color.midNightBlack
        self.genreLabel.textColor = Color.lightGray
        self.titleLabel.textColor = Color.white
        self.subTitleLabel.textColor = Color.lightGray
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

}

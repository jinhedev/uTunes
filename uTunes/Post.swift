//
//  Post.swift
//  uTunes
//
//  Created by rightmeow on 8/30/17.
//  Copyright © 2017 Duckensburg. All rights reserved.
//

import Foundation

class Post: NSObject {

    var artistId: String?
    var collectionId: String?
    var trackId: String?

    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?

    var artistViewUrl: String?
    var collectionViewUrl: String?
    var previewUrl: String?

    var collectionPrice: Float? = 0.0
    var trackPrice: Float? = 0.0

    var releaseDate: NSDate? = NSDate()

    var discCount: Int? = 0
    var discNumber: Int? = 0
    var trackCount: Int? = 0
    var trackNumber: Int? = 0
    var trackTimeMillis: Int? = 0

    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var isStreamable: Bool? = false

}

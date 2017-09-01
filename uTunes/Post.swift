//
//  Post.swift
//  uTunes
//
//  Created by rightmeow on 8/30/17.
//  Copyright © 2017 Duckensburg. All rights reserved.
//

import Foundation

class Post: NSObject {

    var trackId: Int?
    var trackName: String?
    var trackCount: Int? = 0
    var trackNumber: Int? = 0
    var trackTimeMillis: Int? = 0
    var trackCensoredName: String?
    var trackViewUrl: String?
    var trackExplicitness: String?
    var trackPrice: Float? = 0.0

    var artistId: Int?
    var artistName: String?
    var artistViewUrl: String?

    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?

    var collectionId: Int?
    var collectionName: String?
    var collectionCensoredName: String?
    var collectionViewUrl: String?
    var collectionExplicitness: String?
    var collectionPrice: Float? = 0.0

    var previewUrl: String?
    var discCount: Int? = 0
    var discNumber: Int? = 0
    var releaseDate: String?
    var wrapperType: String?
    var kind: String?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var isStreamable: Bool? = false

//    override func setValue(_ value: Any?, forKey key: String) {
//        super.setValue(value, forKey: key)
//    }
//
//    init(dictionary: [String : AnyObject]) {
//        super.init()
//        setValuesForKeys(dictionary)
//    }

}





















